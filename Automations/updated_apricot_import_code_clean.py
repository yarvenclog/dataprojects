print('loading libraries')
import pandas as pd
import time
from datetime import date
from playwright.sync_api import Playwright, sync_playwright, expect
print('libraries loaded')
# start playwright and log into apricot, then download the file to get the current applications

user = "username"
pas = "password"
ap = "https://apricot.socialsolutions.com"

def run(playwright: Playwright) -> None:
    file = open(fr'Redacted path\Intake Logs\{date.today().year}\Intake_log_{date.today()}.txt', 'a')
    browser = playwright.chromium.launch(headless=False)
    context = browser.new_context()
    page = context.new_page()
    page.goto(ap)
    page.get_by_label("Username").click()
    page.get_by_label("Username").fill(user)
    page.get_by_placeholder("your password").click()
    page.get_by_placeholder("your password").fill(pas)
    page.get_by_role("button", name="Log In to Apricot").click()
    page.get_by_role("button", name="Log In to Apricot").click()
    page.get_by_role("button", name="Continue").click()
    page.get_by_role("link", name="My Reports").click()
    page.get_by_role("button", name="Intake Reports").click()
    page.locator("#report_1982_actionsMenu").get_by_role("link", name="Run").click()
    page.get_by_role("button", name="Export").click()
    with page.expect_download() as download_info:
        page.get_by_role("button", name="Export").click()
    download = download_info.value

    # take the downloaded file and turn it into a dataframe for parsing
    app_df = pd.read_excel(download.path())
    app_df = app_df.fillna('')
    app_df.columns = app_df.columns.str.replace(" ","_")
    print(app_df)
    file.write(f"{date.today()} \n {app_df} \n \n")

    # loop over the dataframe and register every person per row
    # iterrows() did not work correctly in the task scheduler, so switched to itertuples()
    for i in app_df.itertuples():
        try:
            print(f"{i.First} {i.Last} registration started")
            page.get_by_role("heading", name="Search Records").click()
            page.get_by_role("link", name="Individual Profile").click()
            page.get_by_role("button", name="New Individual Profile").click()
            page.wait_for_load_state('networkidle')
            page.get_by_role("button", name="Add").click()
            page.get_by_text("Clear Field").click()
            page.get_by_role("textbox", name="First").click()
            page.get_by_role("textbox", name="First").fill(i.First)
            page.wait_for_load_state('networkidle')
            page.get_by_role("textbox", name="Middle").click()
            page.get_by_role("textbox", name="Middle").fill(i.Middle)
            page.wait_for_load_state('networkidle')
            page.get_by_role("textbox", name="Last").click()
            page.get_by_role("textbox", name="Last").fill(i.Last)
            page.wait_for_load_state('networkidle')
            page.get_by_role("textbox", name="Last").press("Enter")
            page.get_by_text(i.First+' '+i.Middle+' '+i.Last).click()
            page.get_by_label("close-modal").click()
            page.wait_for_load_state('networkidle')
            page.get_by_role("textbox", name="Name (Confirmed - copy/paste from &quot;Name from Application&quot; field if available) First Name", exact=True).click()
            page.get_by_role("textbox", name="Name (Confirmed - copy/paste from &quot;Name from Application&quot; field if available) First Name", exact=True).fill(i.First)
            page.get_by_role("textbox", name="Name (Confirmed - copy/paste from &quot;Name from Application&quot; field if available) Last Name", exact=True).click()
            page.get_by_role("textbox", name="Name (Confirmed - copy/paste from &quot;Name from Application&quot; field if available) Last Name", exact=True).fill(i.Last)
            page.get_by_label("Email (Confirmed - copy/paste").click()
            page.get_by_label("Email (Confirmed - copy/paste").fill(i.Email_of_Applicant)
            # check address to see if it has values associated, if not, review them
            if i.Line1 == '' or i.Line1 == ' ':
                page.get_by_placeholder("Line 1").click()
                page.get_by_placeholder("Line 1").fill('review address')
            if i.City == '' or i.City == ' ':
                page.get_by_placeholder("City").click()
                page.get_by_placeholder("City").fill('review city')
            page.get_by_label("Address from Application State", exact=True).select_option("WA")
            if i.County == '' or i.County == ' ':
                page.get_by_placeholder("County").click()
                page.get_by_placeholder("County").fill('review county')
            if i.Zip == '' or i.Zip == ' ':
                page.get_by_label("Address from Application Zip Code 1").click()
                page.get_by_label("Address from Application Zip Code 1").fill('98002')
            page.get_by_role("button", name="Program Access").click()
            if i.Site == 'Mukilteo':
                page.get_by_label("Available Programs", exact=True).select_option("Mukilteo")
            else:
                page.get_by_label("Available Programs", exact=True).select_option("Auburn")
            page.get_by_label("Add selected programs to the").click()
            page.get_by_role("button", name="Apply").click()
            page.get_by_role("button", name="Save Record").click()
            page.wait_for_load_state('networkidle')
            page.get_by_role("button", name="View Folder").click()
            
            print(f'{i.First} {i.Last} Individual Profile added')
            file.write(f"{i.First} {i.Last} Individual Profile added \n")
        except Exception as e:
            print(f"{i.First} {i.Last} Individual Profile FAILED")
            file.write(f"{i.First} {i.Last} Individual Profile FAILED \n")
            page.get_by_label("Apricot 360 Homepage").click()
            continue

    # log into the admin section for the connect registration
    page.get_by_role("link", name="ADMINISTRATOR").click()
    page.get_by_role("heading", name="Connect").click() 
    page.get_by_role("link", name="Participants").click()
    page.wait_for_load_state('networkidle')
    page.get_by_role("button", name="VIEW").click()
    page.get_by_label("Unregistered Participants").click()
    page.wait_for_load_state('networkidle')

    # loop over the dataframe again and register every person individually into the connect portal
    for i in app_df.itertuples():
        try:
            print(f'{i.First} {i.Last} connect registration started')
            page.get_by_placeholder("Search...").click()
            page.get_by_placeholder("Search...").fill(i.Email_of_Applicant)
            page.wait_for_load_state('networkidle')
            page.get_by_role("button", name="SEARCH").click()
            time.sleep(3)
            page.wait_for_load_state('networkidle')
            page.get_by_role("checkbox", name="Select Record").check()
            time.sleep(1)
            page.wait_for_load_state('networkidle')
            try:
                page.get_by_role("button", name="Create Account (1)").click()
                # print(f'{i.First} {i.Last} successfully added')
            except Exception as e:
                print(f"Invalid Email: {i.First} {i.Last} {i.Email_of_Applicant}, {e}")
            page.get_by_role("button", name="close").click()
            print(f'{i.First} {i.Last} Connect Registration complete')
            file.write(f"{i.First} {i.Last} Connect Registration complete \n")
        except Exception as e:
            print(f'FAILED connect registration for {i.First} {i.Last} <--------------------------------------------')
            file.write(f"FAILED connect registration for {i.First} {i.Last} <-------------------------------------------- \n")
             
            # refresh page instead of clicking links? ended up with an error: 
            # error occured because the connect menu was already open, and when it was clicked again, 
            # it closed and couldnt find ppts, so reloading the page fixes that issue
            page.reload(wait_until='load')
            page.get_by_role("heading", name="Connect").click() 
            page.get_by_role("link", name="Participants").click()
            page.wait_for_load_state('networkidle')
            page.get_by_role("button", name="VIEW").click()
            page.get_by_label("Unregistered Participants").click()
            page.wait_for_load_state('networkidle')
            continue


    # ---------------------
    context.close()
    browser.close()



with sync_playwright() as playwright:
    run(playwright)