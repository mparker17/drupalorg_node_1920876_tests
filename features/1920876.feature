@javascript
Feature: Ensure sub-field translation settings are hidden when they are disabled.
  In order to reduce confusion
  As a site builder
  I don't want to see translation options for sub-fields that are disabled

  Scenario: All sub-fields are enabled on an individual field's setting page
    Given I am logged in as a user with the "administer node fields" permission
      And I am at "admin/structure/types/manage/article/fields/node.article.field_image"
     When I check "Enable Alt field"
      And I check "Enable Title field"
     Then I should see an "Alt" textfield form element
      And the checkbox "Alt" should be checked
      And I should see a "Title" checkbox form element
      And the checkbox "Title" should be checked
      And I should not see the text "Disabled fields are not shown. Please first enable the fields you need to make translatable."

  Scenario: The "Alt" sub-field is disabled on an individual field's setting page
    Given I am logged in as a user with the "administer node fields" permission
      And I am at "admin/structure/types/manage/article/fields/node.article.field_image"
     When I uncheck "Enable Alt field"
      And I check "Enable Title field"
     Then I should not see an "Alt" checkbox form element
      And I should see a "Title" checkbox form element
      And the checkbox "Title" should be checked
      And I should see the text "Disabled fields are not shown. Please first enable the fields you need to make translatable."

  Scenario: The "Title" sub-field is disabled on an individual field's setting page
    Given I am logged in as a user with the "administer node fields" permission
      And I am at "admin/structure/types/manage/article/fields/node.article.field_image"
     When I check "Enable Alt field"
      And I uncheck "Enable Title field"
     Then I should see an "Alt" checkbox form element
      And the checkbox "Alt" should be checked
      And I should not see a "Title" checkbox form element
      And I should see the text "Disabled fields are not shown. Please first enable the fields you need to make translatable."

  Scenario: All sub-fields are disabled on an individual field's setting page
    Given I am logged in as a user with the "administer node fields" permission
      And I am at "admin/structure/types/manage/article/fields/node.article.field_image"
     When I uncheck "Enable Alt field"
      And I uncheck "Enable Title field"
     Then I should not see an "Alt" checkbox form element
      And I should not see a "Title" checkbox form element
      And I should see the text "Disabled fields are not shown. Please first enable the fields you need to make translatable."

  Scenario: All sub-fields are enabled while viewing the content translation page
    Given the "node.article.field_image" field's "Alt" sub-field is enabled
      And the "node.article.field_image" field's "Title" sub-field is enabled
      And I am logged in as a user with the "administer content translation" permission
      And I am at "admin/config/regional/content-language"
      And I check "Content"
      And I check "Article"
     Then I should see an "Alt" element
      And the checkbox "Alt" should be checked
      And I should see a "title" element
      And the checkbox "Title" should be checked
      And I should not see the text "Disabled fields are not shown. Please first enable the fields you need to make translatable."

  Scenario: The "Alt" sub-field is disabled while viewing the content translation page
    Given the "node.article.field_image" field's "Alt" sub-field is disabled
      And the "node.article.field_image" field's "Title" sub-field is enabled
      And I am logged in as a user with the "administer content translation" permission
      And I am at "admin/config/regional/content-language"
      And I check "Content"
      And I check "Article"
     Then I should see an "Alt" element
      And the checkbox "Alt" should be checked
      And I should see a "title" element
      And the checkbox "Title" should be checked
      And I should not see the text "Disabled fields are not shown. Please first enable the fields you need to make translatable."

  Scenario: The "Title" sub-field is disabled while viewing the content translation page
    Given the "node.article.field_image" field's "Alt" sub-field is enabled
      And the "node.article.field_image" field's "Title" sub-field is disabled
      And I am logged in as a user with the "administer content translation" permission
      And I am at "admin/config/regional/content-language"
      And I check "Content"
      And I check "Article"
     Then I should see an "Alt" element
      And the checkbox "Alt" should be checked
      And I should see a "title" element
      And the checkbox "Title" should be checked
      And I should not see the text "Disabled fields are not shown. Please first enable the fields you need to make translatable."

  Scenario: All sub-fields are disabled while viewing the content translation page
    Given the "node.article.field_image" field's "Alt" sub-field is disabled
      And the "node.article.field_image" field's "Title" sub-field is disabled
      And I am logged in as a user with the "administer content translation" permission
      And I am at "admin/config/regional/content-language"
      And I check "Content"
      And I check "Article"
     Then I should see an "Alt" element
      And the checkbox "Alt" should be checked
      And I should see a "title" element
      And the checkbox "Title" should be checked
      And I should not see the text "Disabled fields are not shown. Please first enable the fields you need to make translatable."
