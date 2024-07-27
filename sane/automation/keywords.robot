*** Settings ***
Library     SeleniumLibrary
Library    ../lib/python3.12/site-packages/robot/libraries/Screenshot.py
Library    ../lib/python3.12/site-packages/robot/libraries/XML.py
Variables   /Users/saneshvk/Desktop/assessment/sane/automation/paths.py
Library    DateTime
Library    ../lib/python3.12/site-packages/robot/libraries/String.py

*** Keywords ***

    
launch_setup
    [Arguments]     ${browsername}
    SeleniumLibrary.Open Browser     ${null}  ${browsername}
login_test_key
    [Arguments]    ${username}    ${password}    
    SeleniumLibrary.Go To    ${myaccount_url}
    SeleniumLibrary.Wait Until Element Is Visible    ${username_field}
    SeleniumLibrary.Input Text    ${username_field}      ${username}
    SeleniumLibrary.Input Text      ${password_field}    ${password}
    SeleniumLibrary.Click Element    ${login_button}

enter page url
     [Arguments]      ${page_url}
    SeleniumLibrary.Go To    ${page_url}

product_page_field_test_key
    [Arguments]    ${phone_number}    
    # SeleniumLibrary.Go To    ${page_url}
    # SeleniumLibrary.Go To    ${page_url}
    SeleniumLibrary.Maximize Browser Window
    SeleniumLibrary.Wait Until Element Is Visible    ${Variation_color}
    SeleniumLibrary.Click Element    ${Variation_color}
    SeleniumLibrary.Click Element    ${variation_orientation}
    SeleniumLibrary.Input Text    ${profile_description}    Just Do It
    Execute Javascript    window.scrollBy(0, 700)
    SeleniumLibrary.Wait Until Element Is Visible    ${phone_no_checkbox}    timeout=10
    SeleniumLibrary.Select Checkbox    ${phone_no_checkbox}
    BuiltIn.Sleep    1
    SeleniumLibrary.Input Text    ${phone_no_field}    ${phonenumber}
    BuiltIn.Sleep    1
    SeleniumLibrary.Choose File    ${logo}    /Users/saneshvk/Desktop/assessment/screenshot_1.jpg
    BuiltIn.Sleep    1
    SeleniumLibrary.Click Element    ${border1}
    BuiltIn.Sleep    1
    SeleniumLibrary.Click Element    ${border2}
    BuiltIn.Sleep    1
    SeleniumLibrary.Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    SeleniumLibrary.Click Element    ${addtocart}

validating_add_to_cart message
    SeleniumLibrary.Execute Javascript    window.scrollTo(0, 0)
    ${message}    SeleniumLibrary.Get Text    ${success_message}
    SeleniumLibrary.Element Should Contain    ${success_message}    ${message}
    BuiltIn.Log    ${message}
    BuiltIn.Sleep    3

phone_no_field_validation_test_key
    [Arguments]    ${phone_number}
    # page_url_as an argument        ${productpage_url}
    product_page_field_test_key    ${phone_number}    
    ${alert_message}    SeleniumLibrary.Get Text    ${inavlid_phone_alert}
    SeleniumLibrary.Element Should Contain    ${inavlid_phone_alert}    ${alert_message}
    BuiltIn.Log To Console    ${alert_message}
    BuiltIn.Log    ${alert_message}

minimum_selection_test_key
    [Arguments]    ${phone_number}
    # page_url_as an argument        $page_url÷
    product_page_field_test_key    ${phone_number}    
    SeleniumLibrary.Click Element    ${border2}
    SeleniumLibrary.Unselect Checkbox    ${phone_no_checkbox} 
    BuiltIn.Sleep    3
    ${expected_min_select_message}    SeleniumLibrary.Get Text    ${multi_select_alert}
    SeleniumLibrary.Element Should Contain    ${multi_select_alert}    ${expected_min_select_message}


product_quickview_tets_key
    SeleniumLibrary.Mouse Over    ${RF_id_card}
    SeleniumLibrary.Click Element    ${quick_view_btn}
    BuiltIn.Sleep    3       
    ${status}    BuiltIn.Run Keyword And Return Status    product_page_field_test_key    9876543210
    BuiltIn.Run Keyword If    ${status}== 'FAIL'     errror handling
    BuiltIn.Log To Console   An element is disabled

    
checkout_page_field_test_key
    SeleniumLibrary.Go To    ${cap_prooduct_page_url}
    SeleniumLibrary.Wait Until Element Is Visible    ${addtocart}
    SeleniumLibrary.Click Element    ${addtocart}
    SeleniumLibrary.Go To    ${checkout_page_url}

filling the fields

    SeleniumLibrary.Wait Until Element Is Visible    ${firstname_field}

    SeleniumLibrary.Input Text    ${firstname_field}       Fname
    BuiltIn.Sleep    1
    SeleniumLibrary.Input Text    ${lastname_field}    Lname
    # SeleniumLibrary.Click Element    ${country_dropdown}
    SeleniumLibrary.Execute Javascript     window.scrollBy(0,500)
    SeleniumLibrary.Wait Until Element Is Visible    ${country_dropdown}    timeout=10
    SeleniumLibrary.Click Element    ${country_dropdown}
    SeleniumLibrary.Input Text    ${country_searchfield}    india
    SeleniumLibrary.Click Element    ${india}
    SeleniumLibrary.Input Text    ${street_address}    123 abc
    SeleniumLibrary.Input Text    ${city}    Calicut
    SeleniumLibrary.Click Element    ${state_dropdown}
    SeleniumLibrary.Input Text    ${state_searchfield}    Kerala
    SeleniumLibrary.Wait Until Element Is Visible    ${kerala}    timeout=10
    SeleniumLibrary.Click Element    ${kerala}
    SeleniumLibrary.Input Text    ${pincode_field}     673016
    SeleniumLibrary.Input Text    ${phone_no_field}    9876543210
    SeleniumLibrary.Input Text    ${email_field}    abcd@demo.com    
validating total price
    SeleniumLibrary.Wait Until Element Is Visible    ${total_price}    timeout=10
    ${total_price_without_delivery}    SeleniumLibrary.Get Text    ${total_price}
    SeleniumLibrary.Click Element    ${delivery_yes_radio}
    BuiltIn.Sleep    4
    SeleniumLibrary.Wait Until Element Is Visible    ${total_price}
    ${total_price_with_delivery}    SeleniumLibrary.Get Text    ${total_price}
    ${withoutdelivery_total_as_integer}      String.Remove String    ${total_price_without_delivery}    $    #removing dollar sign from the price-text
    ${withdelivery_total_as_integer}    String.Remove String    ${total_price_with_delivery}    $
    # ${grand_total}    BuiltIn.Evaluate    ${withoutdelivery_total_as_integer} + 5
    # BuiltIn.Log To Console    ${grand_total}
    BuiltIn.Should Not Be Equal   ${withoutdelivery_total_as_integer}    ${withdelivery_total_as_integer}
    # SeleniumLibrary.Input Text    ${date_box}    28/07/2024
placing the order
     SeleniumLibrary.Click Element    ${date_box}
     
     SeleniumLibrary.Wait Until Element Is Visible    ${calendar}
    SeleniumLibrary.Click Element    ${a_date}
    SeleniumLibrary.Click Element    ${time_box}
    SeleniumLibrary.Wait Until Element Is Visible    ${time}
    SeleniumLibrary.Click Element    ${time}
    SeleniumLibrary.Click Element    ${wooden_packing}
    SeleniumLibrary.Click Element    ${placeorder_btn}
    BuiltIn.Sleep    10
    # Screenshot.Take Screenshot
    SeleniumLibrary.Element Should Be Visible    ${order_details}
    ${necessary_fields}    SeleniumLibrary.Get Text     ${order_details}
    BuiltIn.Should Not Be Empty    ${necessary_fields}
    login_test_key    test_customer    password
   SeleniumLibrary.Wait Until Element Is Visible    ${orders}
   SeleniumLibrary.Click Element    ${orders}
    SeleniumLibrary.Wait Until Element Is Visible    ${view_btn}
    SeleniumLibrary.Click Element    ${view_btn}
    SeleniumLibrary.Element Should Be Visible    ${order_details}
    ${fields_in_orederdetails}    SeleniumLibrary.Get Text     ${order_details}



    


    # contain

    # #  tomorrow's date
    #  BuiltIn.Sleep    3

    #  ${currentdate}    DateTime.Get Current Date
    #  BuiltIn.Log To Console    ${currentdate}
    #  ${removal_of_rseiduals1}    String.Remove String    ${currentdate}    .split('')
    #  BuiltIn.Log To Console    ${removal_of_rseiduals1}
    #  ${removal_of_rseiduals2}    String.Remove String    ${removal_of_rseiduals1}    2024-07-

    #  ${current_date_as_no}      BuiltIn.Convert To Number      ${removal_of_rseiduals2}    
    #  ${tomorrow's_date}    BuiltIn.Evaluate    ${current_date_as_no} + 1
    #  BuiltIn.Log To Console    ${tomorrow's_date}
    #  Click Element    //*[text()="${tomorrow's_date}"] 




tomorrow's date
    ${today}    DateTime.Get Current Date    result_format=%d-%m-%Y
    ${tomorrow}    Evaluate    (datetime.datetime.strptime('${today}', '%d-%m-%Y') + datetime.timedelta(days=1)).strftime('%d-%m-%y')    modules=datetime
    [Return]    ${tomorrow}
    
Select Date
    [Arguments]    ${date}
    ${day}    Evaluate    str(${date})[:2]
    Click Element    //*[text()="${day}"]  # Adjust the locator to match the.calendar elemen
    
      
...    
# ...                '['DO YOU WANT THE PRODUCT TO BE DELIVERED? (YES):', 'Cash On Delivery', 'TOTAL', 'Delivery Time:', 'calicut', 'Kerala, India']' does not contain 'Order details    PRODUCT TOTAL    Cap × 1 $16.00    SUBTOTAL: $16.00    SHIPPING: Flat Rate    DO YOU WANT THE PRODUCT TO BE DELIVERED? (YES): $5.00    PAYMENT METHOD: Direct Bank Transfer    TOTAL: $21.00    BILLING DETAILS    Do You Want The Product To Be Delivered?: Yes    Delivery Date: 28/07/2024    Delivery Time: 12:00 AM    DELIVERY ADD-ONS    Packaging: Wooden Box Protection'

    