import pandas as pd
from playwright.sync_api import Playwright, sync_playwright, expect


def run(playwright: Playwright) -> None:
    browser = playwright.chromium.launch(headless=False)
    context = browser.new_context()
    page = context.new_page()
    page.goto("https://apricot.socialsolutions.com/auth")
    page.get_by_label("Username").click()
    page.get_by_label("Username").fill("username")
    page.get_by_label("Username").press("Tab")
    page.get_by_placeholder("your password").fill("password")
    page.get_by_role("button", name="Log In to Apricot").click()
    page.get_by_role("button", name="Log In to Apricot").click()
    page.get_by_role("button", name="Continue").click()
    page.get_by_role("link", name="My Reports").click()
    page.get_by_role("button", name="Quality control").click()
    page.locator("#report_2440_actionsMenu").get_by_role("link", name="Run").click()
    page.get_by_role("button", name="Export").click()
    with page.expect_download() as download_info:
        page.get_by_role("button", name="Export").click()
    download = download_info.value

    doub_df = pd.read_excel(download.path())
    doub_df = doub_df.fillna('')
    doub_df.columns = doub_df.columns.str.replace(" ","_")
    page1 = context.new_page()
    page1.set_default_timeout(60000)

    for i in doub_df.itertuples():
        page1.goto(f'https://apricot.socialsolutions.com/document/edit/id/{i.Record_ID}')
        page1.get_by_role("button", name="Program Access").click()
        page1.get_by_label("Assigned Programs", exact=True).select_option("Mukilteo")
        page1.get_by_label("Remove selected programs from").click()
        page1.get_by_role("button", name="Apply").click()
        page1.get_by_role("button", name="Save Record").click()
        page1.get_by_role("button", name="Continue").click()

    # ---------------------
    context.close()
    browser.close()


with sync_playwright() as playwright:
    run(playwright)
