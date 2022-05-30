package DomUtils;

use strict;
use warnings;
use XML::DOM;
use Carp;

# Finds the first child with a given name
sub findfirst {
  my $parent_node = shift;
  my $node_name   = shift;
  my $nodes       = $parent_node->getElementsByTagName($node_name);
  return($nodes->item(0));
}

# Extracts only the child text nodes
sub get_child_text {
  my $node = shift;
  my $text = '';
  if (defined($node)) {
    foreach my $childNode ($node->getChildNodes) {
      if (   $childNode->getNodeType == TEXT_NODE
          || $childNode->getNodeType == ENTITY_REFERENCE_NODE) {
        $text .= $childNode->getData;
      }
    }
  }
  return ($text);
}

# Extracts all the descendant text nodes
sub get_descendant_text {
  my $node = shift;
  my $text = '';
  if (defined($node)) {
    if ($node->getNodeType == ELEMENT_NODE) {
      foreach my $childNode ($node->getChildNodes) {
        $text .= &get_descendant_text($childNode);
      }
    } elsif (   $node->getNodeType == TEXT_NODE
             || $node->getNodeType == ENTITY_REFERENCE_NODE) {
      $text .= $node->getData;
    }
  }
  return ($text);
}

# Adds both text and entities to a node, as necessary
sub add_text_and_entities {
  my $doc  = shift;
  my $node = shift;
  my $text = shift;
  while ($text =~ /^(.*?)\&(\#?[A-Za-z0-9]+?);(.*)$/os) {
    my ($front, $entity, $rear) = ($1, $2, $3);
    $node->addText($front) if ($front ne '');
    my $entity_ref = $doc->createEntityReference($entity);
    $node->appendChild($entity_ref);
    $text = $rear;
  }
  $node->addText($text) if ($text ne '');
}

# Removes all children of a node with a particular name, but preserves the
#  grandchildren
sub remove_intermediate {
  my $node    = shift;
  my $tagname = shift;
  if (defined($node)) {
    foreach my $doomedNode ($node->getElementsByTagName($tagname)) {
      foreach my $childNode ($doomedNode->getChildNodes()) {
        $doomedNode->getParentNode->insertBefore($childNode, $doomedNode);
      }
      $doomedNode->getParentNode->removeChild($doomedNode);
    }
  } else {
    die("Cannot remove <$tagname> from an undefined node!");
  }
}

sub insertAfterWithReplace ($$$) {
  my $parent = shift;
  my $newElement = shift;
  my $precedingSibling = shift;
  my $oldElement = findfirst($parent, $newElement->getNodeName());
  if (defined $oldElement) {
    $parent->removeChild($oldElement);
  }
  if (defined $precedingSibling) {
    # make sure insertBefore is not going to fail due to precedingSibling
    # belonging to a different parent
    unless ($parent == $precedingSibling->getParentNode()) {
      confess("\$precedingSibling does not have parent \$parent");
    }
    $parent->insertBefore($newElement, $precedingSibling->getNextSibling());
  } else {
    # no preceding sibling so append at end
    $parent->appendChild($newElement);
  }
  return $newElement;
}

# Returns the nearest ancestor element of given node, or undef if the node
# does not have an ancestor with the given tag name.
sub get_nearest_ancestor_of {
  my $node    = shift;
  my $tagName = shift;
  while (defined($node)) {
    if ($node->getNodeType == ELEMENT_NODE && $node->getTagName eq $tagName) {
      return $node;
    }
    $node = $node->getParentNode;
  }
  return undef;
}

# Boolean test to see if an ancestor of a particular element
sub ancestor_of {
  my $node    = shift;
  my $tagName = shift;
  while (defined($node)) {
    if ($node->getNodeType == ELEMENT_NODE && $node->getTagName eq $tagName) {
      return (1);
    }
    $node = $node->getParentNode;
  }
  return (0);
}

sub readXMLFragment ($$) {
  my $doc = shift;   # reference to document to import fragment into
  my $chunk = shift;   # an XML string
  my $parser = XML::DOM::Parser->new(ErrorContext => 2);
  # include bogus !DOCTYPE so DOM will allow entities
  my $dummyXML = '<!DOCTYPE FRAGMENT PUBLIC "BOGUS" "BOGUS"><FRAGMENT>' . $chunk . '</FRAGMENT>';
  my $tempDoc = $parser->parsestring($dummyXML);
  my $tempRoot = $tempDoc->getDocumentElement();
  my $tempFragment = $tempDoc->createDocumentFragment();
  foreach my $node ($tempRoot->getChildNodes()) {
    $tempFragment->appendChild($node);
  }
  # here we do some magic by moving nodes from a new document
  # into the old document (Perl XML::DOM extension setOwnerDocument)
  $tempFragment->setOwnerDocument($doc);
  $tempDoc->dispose();
  $tempDoc = undef;
  return $tempFragment;
}

sub is_within {
  my $node = shift;
  my $parent = shift;
  my $within = 0;
  my $testNode = $node->getParentNode;
  while (   defined($testNode)
         && $testNode->getNodeType == ELEMENT_NODE
         && (!$within)) {
    if ($testNode->getTagName eq $parent) {
      $within = 1;
    }
    $testNode = $testNode->getParentNode;
  }
  return($within);
}

sub remove_children_named {
  my $node = shift;
  my $name = shift;
  foreach my $childNode ($node->getChildNodes) {
    if (&is_element_named($childNode, $name)) {
      &remove($childNode);
    }
  }
}

sub is_element_named {
  my $node = shift;
  my $name = shift;
  if (   defined($node)
      && $node->getNodeType == ELEMENT_NODE
      && $node->getTagName eq $name) {
    return(1);
  }
  return(0);
}

sub insert_after {
  my $node = shift;
  my $afterNode = shift;
  if (defined($afterNode->getNextSibling)) {
    $afterNode->getParentNode->insertBefore($node, $afterNode->getNextSibling);
  } else {
    $afterNode->getParentNode->appendChild($node);
  }
}

sub remove {
  my $node = shift;
  $node->getParentNode->removeChild($node);
}

sub removetagsonly {
  my $node = shift;
  foreach my $childNode ($node->getChildNodes) {
    $node->getParentNode->insertBefore($childNode, $node);
  }
  $node->getParentNode->removeChild($node);
}

sub remove_attributes {
  my $node     = shift;
  my @namelist = ();
  my $attributes = $node->getAttributes;
  my $n          = $attributes->getLength;
  for (my $i = 0; $i < $n; $i++) {
    if (defined($attributes->item($i))) {
      push(@namelist, $attributes->item($i)->getName);
    }
  }
  foreach my $attr_name (@namelist) {
    $node->removeAttribute($attr_name);
  }
} 

sub merge_continuous {
  my $node = shift;
  my $tagName = shift;
  foreach my $tagNode ($node->getElementsByTagName($tagName)) {
    if (defined($tagNode->getNextSibling)
        && $tagNode->getNextSibling->getNodeType == ELEMENT_NODE
        && $tagNode->getNextSibling->getNodeName eq $tagName) {
         foreach my $childNode ($tagNode->getNextSibling->getChildNodes) {
           $tagNode->appendChild($childNode);
         }
         $tagNode->getParentNode->removeChild($tagNode->getNextSibling);         
    }
  }
}

sub loadXML ($) {
  my $inputFilename = shift;
  my $parser = XML::DOM::Parser->new(ErrorContext => 2);
  my $doc;
  unless (-f $inputFilename) {
    croak("Input XML file does not exist: $inputFilename");
  }
  unless (-s $inputFilename) {
    croak("Input XML file is empty: $inputFilename");
  }
  open(IN, "<:utf8", $inputFilename);
  my $buffer = '';
  while (<IN>) {
    $buffer .= $_;
  }
  close(IN);
  # use eval to trap parsing errors
  if (!defined(eval {$doc = $parser->parse($buffer)})) {
    my $error_text = $@;
    croak("XML file $inputFilename did not parse!  Errors:\n\n$error_text\n\n");
  }
  return $doc;
}

sub saveXML ($$) {
  my $doc = shift;
  my $outputFilename = shift;
  open(OUT, ">:utf8", $outputFilename)
    or croak("open: $outputFilename\: $!");
  $doc->printToFileHandle(\*OUT);
  #  print OUT $doc->toString;
  close(OUT);
}

# Sets the tag compression we need for Epic.  Used like this:
# XML::DOM::setTagCompression(\&COMMON::DomUtils::def_tag_compression);
sub def_tag_compression {
  my ($tag, $elem) = @_;
  return 1 if ($tag =~ /^(in|sum|pr|de)$/);
  return 0;
}

sub beautify {
  # Indents an XML file for human readability
  my $doc        = shift;
  my $node       = shift;
  my $level      = shift;
  my $whitespace = "\n";
  for (my $i = 0; $i < $level; $i++) {
    $whitespace .= '  ';
  }
  my $parentNode = $node->getParentNode;
  if (   $node->getNodeType == ELEMENT_NODE
      && defined($parentNode)
      && $parentNode->getNodeType == ELEMENT_NODE) {
    $parentNode->insertBefore($doc->createTextNode($whitespace), $node);
  }
  my $sawChildren = 0;
  # Recurse into any children
  foreach my $childNode ($node->getChildNodes) {
    if ($childNode->getNodeType == ELEMENT_NODE) {
      $sawChildren = 1;
      &beautify($doc, $childNode, $level + 1);
    }
  }
  if ($sawChildren) {
    $node->appendChild($doc->createTextNode($whitespace));
  }
}

sub get_elements_with_name_on_list {
  my ($node, $listRef) = @_;
  my @nodes = ();
  if ($node->getNodeType == ELEMENT_NODE) {
    if (grep($node->getTagName eq $_, @{$listRef})) {
      push(@nodes, $node);
    }
    foreach my $childNode ($node->getChildNodes) {
      push(@nodes, &get_elements_with_name_on_list($childNode, $listRef));
    }
  }
  return(@nodes);
}

# End of module; return true
1;
