package com.vytrack.notes;

import com.vytrack.utilities.BrowserUtils;
import com.vytrack.utilities.Driver;
import com.vytrack.utilities.Pages;
import org.openqa.selenium.By;

public class calculation {
    static Pages page = new Pages();

    public static void main(String[] args) {
        Driver.getDriver().get("http://qa2.vytrack.com/user/login");
        page.loginPage().login("driver");
        page.dashboardPage().navigateToModule("Fleet", "Vehicles");
        BrowserUtils.waitPlease(2);
//        page.vehiclesPage().clickRandomVehicle();

        int size =BrowserUtils.getCountOfRows(By.cssSelector("tbody[class='grid-body']>tr"));       // table[id='table1'] > tbody>tr
        System.out.println("size fo table :"+size);
        int random=BrowserUtils.randomInt(size);
        System.out.println("element of :"+random);
        Driver.getDriver().findElement(By.cssSelector("tbody[class='grid-body'] tr:nth-of-type(" + random + ")")).click();
        BrowserUtils.waitFor(2);
//
//        Driver.getDriver().findElement(By.cssSelector("tr:nth-of-type(1) td:nth-of-type(1)")).click();
//        BrowserUtils.waitPlease(1);
//        Driver.getDriver().findElement(By.xpath("//a[contains(text(),'Activity')]")).click();
//        BrowserUtils.waitPlease(1);
//        WebElement element = Driver.getDriver().findElement(By.cssSelector("div[class='items list-box list-shaped']"));
//        System.out.println("element.getSize is:" +element.getSize());
    }



}
