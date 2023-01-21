from  bs4 import BeautifulSoup
import requests
import time
import csv 
import pandas as pd

# URL = 'https://markets.businessinsider.com/commodities/oil-price'

# headers = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.76"}

# page = requests.get(URL, headers=headers,cookies={'__hs_opt_out': 'no'})

# soup1 = BeautifulSoup(page.content, "html.parser")


# soup2 = BeautifulSoup(soup1.prettify(), "html.parser")


# name = soup2.find("span","price-section__label").text.strip()
# price = soup2.find("span","price-section__current-value").text.strip()

# import datetime

# datetime = datetime.datetime.now()
# print(datetime.strftime('%d-%m-%Y, %H:%M:%S'))

# import csv 
# header = ['Name', 'Price', 'Date']
# data = [name, price, datetime]

# with open('BrentOilPriceWebScraper.csv', 'w', newline='', encoding='UTF8') as f:
#     writer = csv.writer(f)
#     writer.writerow(header)
#     writer.writerow(data)

# with open('BrentOilPriceWebScraper.csv', 'a+', newline ='', encoding='UTF8') as f:
#     writer = csv.writer(f)
#     writer.writerow(data)



    


def check_price():

    URL = 'https://markets.businessinsider.com/commodities/oil-price'

    headers = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.76"}
    page = requests.get(URL, headers=headers,cookies={'_s_hs_opt_out': 'no'})

    soup1 = BeautifulSoup(page.content, "html.parser")
    soup2 = BeautifulSoup(soup1.prettify(), "html.parser")

    name = soup2.find("span",class_ ="price-section__label").text.strip()
    price = soup2.find("span",class_ ="price-section__current-value").text.strip()

    import datetime
    datetime = datetime.datetime.now()
    datetime = datetime.strftime('%d-%m-%Y, %H:%M:%S')
   
    header = ['Name', 'Price', 'Date']
    data = [name, price, datetime]

    with open('BrentOilPriceWebScraper.csv', 'a+', newline ='', encoding='UTF8') as f:
        writer = csv.writer(f)
        writer.writerow(data)
    print(name, price, datetime)


while (True):
    check_price()
    time.sleep(180)



  