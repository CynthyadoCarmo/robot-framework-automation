from robot.api.deco import keyword
from selenium import webdriver
from selenium.webdriver.common.by import By
import time
import os

driver = None


@keyword("Abrir Navegador")
def abrir_navegador(url):

    global driver

    driver = webdriver.Chrome()

    driver.maximize_window()

    driver.get(url)


@keyword("Preencher Campo")
def preencher_campo(locator, texto):

    driver.find_element(By.XPATH, locator).send_keys(texto)


@keyword("Clicar Elemento")
def clicar_elemento(locator):

    driver.find_element(By.XPATH, locator).click()


@keyword("Esperar")
def esperar(tempo):

    time.sleep(int(tempo))


@keyword("Tirar Print")
def tirar_print(nome_arquivo):

    pasta = os.path.join(os.getcwd(), "screenshots")

    if not os.path.exists(pasta):
        os.makedirs(pasta)

    caminho = os.path.join(pasta, f"{nome_arquivo}.png")

    driver.save_screenshot(caminho)


@keyword("Fechar Navegador")
def fechar_navegador():

    time.sleep(2)

    driver.quit()


@keyword("Validar Texto")
def validar_texto(locator, texto_esperado):

    texto = driver.find_element(By.XPATH, locator).text

    assert texto_esperado in texto

@keyword("Scroll Ate Elemento")
def scroll_ate_elemento(locator):

    elemento = driver.find_element(By.XPATH, locator)

    driver.execute_script(
        "arguments[0].scrollIntoView({block: 'center'});",
        elemento
    )

    time.sleep(2)

@keyword("Clicar Com JavaScript")
def clicar_com_javascript(locator):

    elemento = driver.find_element(By.XPATH, locator)

    driver.execute_script(
        "arguments[0].click();",
        elemento
    )