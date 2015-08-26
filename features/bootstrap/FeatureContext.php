<?php
/**
 * @file
 * Contains \FeatureContext.
 *
 * @see https://gist.github.com/pbuyle/7698675
 */

use Behat\Behat\Context\BehatContext;
use Behat\Behat\Context\ClosuredContextInterface;
use Behat\Behat\Context\SnippetAcceptingContext;
use Behat\Behat\Context\TranslatedContextInterface;
use Behat\Behat\Tester\Exception\PendingException;
use Drupal\DrupalExtension\Context\RawDrupalContext;

/**
 * Defines application features from the specific context.
 */
class FeatureContext extends RawDrupalContext implements SnippetAcceptingContext {

  /**
   * Initializes context.
   *
   * Every scenario gets its own context instance.
   * You can also pass arbitrary arguments to the
   * context constructor through behat.yml.
   */
  public function __construct() {
  }

  /**
   * Checks that a form element with a specified label is visible on the page.
   *
   * @Then I should see a/an :label form element
   */
  public function assertFormElementOnPage($label) {
    $element = $this->getSession()->getPage();
    $nodes = $element->findAll('css', '.form-item label');
    foreach ($nodes as $node) {
      if ($node->getText() === $label) {
        if ($node->isVisible()) {
          return;
        }
        else {
          throw new \Exception("Form item with label \"$label\" not visible.");
        }
      }
    }
    throw new \Behat\Mink\Exception\ElementNotFoundException($this->getSession(), 'form item', 'label', $label);
  }

  /**
   * Checks that a form element with a specified label and type is visible on the
   * page.
   *
   * @Then I should see a/an :label :type form element
   */
  public function assertTypedFormElementOnPage($label, $type) {
    $container = $this->getSession()->getPage();
    $pattern = '/(^| )form-type-' . preg_quote($type) . '($| )/';
    $label_nodes = $container->findAll('css', '.form-item label');
    foreach ($label_nodes as $label_node) {
      // Note: getText() will return an empty string when using Selenium2D. This
      // is ok since it will cause a failed step.
      if ($label_node->getText() === $label && preg_match($pattern, $label_node->getParent()
          ->getAttribute('class')) && $label_node->isVisible()
      ) {
        return;
      }
    }
    throw new \Behat\Mink\Exception\ElementNotFoundException($this->getSession(), $type . ' form item', 'label', $label);
  }

  /**
   * Checks that a form element with a specified label is not visible on the
   * page.
   *
   * @Then I should not see a/an :label form element
   */
  public function assertFormElementNotOnPage($label) {
    $element = $this->getSession()->getPage();
    $nodes = $element->findAll('css', '.form-item label');
    foreach ($nodes as $node) {
      // Note: getText() will return an empty string when using Selenium2D. This
      // is ok since it will cause a failed step.
      if ($node->getText() === $label && $node->isVisible()) {
        throw new \Exception();
      }
    }
  }

  /**
   * Checks that a form element with a specified label and type is not visible
   * on the page.
   *
   * @Then I should not see a/an :label :type form element
   */
  public function assertTypedFormElementNotOnPage($label, $type) {
    $container = $this->getSession()->getPage();
    $pattern = '/(^| )form-type-' . preg_quote($type) . '($| )/';
    $label_nodes = $container->findAll('css', '.form-item label');
    foreach ($label_nodes as $label_node) {
      // Note: getText() will return an empty string when using Selenium2D. This
      // is ok since it will cause a failed step.
      if ($label_node->getText() === $label && preg_match($pattern, $label_node->getParent()
          ->getAttribute('class')) && $label_node->isVisible()
      ) {
        throw new \Behat\Mink\Exception\ElementNotFoundException($this->getSession(), $type . ' form item', 'label', $label);
      }
    }
  }

  /**
   * @Given the :arg1 field's :arg2 sub-field is enabled
   */
  public function theFieldSSubFieldIsEnabled($arg1, $arg2) {
    throw new PendingException();
  }

  /**
   * @Given the :arg1 field's :arg2 sub-field is disabled
   */
  public function theFieldSSubFieldIsDisabled($arg1, $arg2) {
    throw new PendingException();
  }

}
