import XCTest
import DeviceKit

class DanilUITests: XCTestCase {
    let commentCellName = "OpenCommentCell"

    func launch(darkTheme: Bool = false) {
        let app = XCUIApplication()
        setupSnapshot(app, waitForAnimations: false)
        app.launchArguments = [
            "disableReviewPrompts",
            "skipAnimations",
            "disableOnboarding"
        ]

        app.launch()
    }
    
    
    
    
    // FIXME: не работает
    func testCheckOpenSettingsScreen() {
        launch()

        let itemCell = XCUIApplication().collectionViews.cells.firstMatch
        let setting = XCUIApplication().navigationBars.buttons["Settings"]
        setting.tap()
        XCTAssertTrue(XCUIApplication().staticTexts["Hackers, By Weiran Zhang"].exists)
    }
    
    
    
    
    
    
    
    
    // TODO: done
    func testOpenSecondPostAndCheckFirstComment() {
        launch()

        let itemCell = XCUIApplication().collectionViews.cells.element(boundBy: 1)
        XCTAssertTrue(waitForElementToAppear(itemCell))
        
        itemCell.firstMatch.tap()

        let commentsTable = XCUIApplication().tables["CommentsTableView"]
        XCTAssertTrue(commentsTable.waitForExistence(timeout: 10))
        XCTAssertTrue(commentsTable.cells.allElementsBoundByIndex[0].exists)
    }





    // FIXME: не работает
    func testTypeLoginAndPasswordFields() {
        launch()

        let itemCell = XCUIApplication().collectionViews.cells.firstMatch
        let setting = XCUIApplication().navigationBars.buttons["Settings"]
        setting.tap()
        
        let itemCell2 = XCUIApplication().collectionViews.cells.firstMatch
        let loginButton = XCUIApplication().buttons[""]
        loginButton.tap()
        XCTAssertTrue(loginButton.waitForExistence(timeout: 10))
    }
    
    
    
    
    
    // FIXME: не работает
    func testOpenSpecificNamePost() {
        launch()
        
        let postName = "How to own your own Docker Registry address"
        
        XCTAssertTrue(XCUIApplication().collectionViews.cells.staticTexts[postName].exists)
    }
    
    
    
    
    
    
    // FIXME: не работает
    func testCheckExistPostWithImageStub() {
        launch()
        
        //let itemCell = XCUIApplication().collectionViews.cells.
        
        //XCTAssertTrue(XCUIApplication().collectionViews.cells.staticTexts[postName].exists)
    }
    
    
    
    
    
    
    
    func waitForElementToAppear(_ element: XCUIElement) -> Bool {
        let predicate = NSPredicate(format: "exists == true")
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: element)
        let result = XCTWaiter().wait(for: [expectation], timeout: 5)
        return result == .completed
    }
}


