*** Settings ***
Resource   ./keywords.robot
Test Setup    keywords.launch_setup      chrome
Suite Setup    Screenshot.Set Screenshot Directory    sane/automation/screenshots

*** Test Cases ***
login_TC
    keywords.login_test_key   test_customer    password
product_page_field_TC
    keywords.enter page url    ${productpage_url}
    keywords.product_page_field_test_key    9876543210    
    keywords.validating_add_to_cart message

phone_no_field_validation_TC
    keywords.enter page url    ${productpage_url}
    keywords.phone_no_field_validation_test_key      abcdefgh

minimum_selelction_TC
    keywords.enter page url    ${productpage_url}
    keywords.minimum_selection_test_key     ${null}
product_quickview_tets_TC
    keywords.enter page url    ${quickview_url}
    keywords.product_quickview_tets_key   
chcheckout_page_field_test_key_TC
    checkout_page_field_test_key
    keywords.filling the fields
    keywords.validating total price
    keywords.placing the order
