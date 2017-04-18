Feature: Todos App
  Scenario: I can create new tasks
    When I run `todo new hi`
    And I run `todo new guy`
    Then the file "tmp/fake_home/.todos.txt" should contain "hi\nguy"

  Scenario: I can list my existing tasks
    Given a file named "tmp/fake_home/.todos.txt" with:
    """
    Wash the dishes
    Clean the garage

    """
    When I run `todo list`
    Then stdout should contain exactly:
    """
    Wash the dishes
    Clean the garage

    """

  Scenario: I can mark the top todo as done
    Given a file named "tmp/fake_home/.todos.txt" with:
    """
    Wash the dishes
    Clean the garage

    """
    When I run `todo done`
    And I run `todo list`
    Then stdout should contain:
    """
    Clean the garage

    """
    And stdout should not contain:
    """
    Wash the dishes
    """

