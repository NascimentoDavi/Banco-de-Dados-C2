from utils import config
from utils.splash_screen import SplashScreen
from reports.relatorios import Relatorio
from controller.controller_vilao import Controller_Vilao
from controller.controller_veiculo import Controller_Veiculo
from controller.controller_arma import Controller_Arma
from controller.controller_vilao_arma import Controller_Vilao_Arma
from controller.controller_vilao_veiculo import Controller_Vilao_Veiculo

tela_inicial = SplashScreen()
relatorio = Relatorio()
ctrl_vilao = Controller_Vilao()
ctrl_veiculo = Controller_Veiculo()
ctrl_arma = Controller_Arma()
ctrl_vilao_arma = Controller_Vilao_Arma()
ctrl_vilao_veiculo = Controller_Vilao_Veiculo()

def reports(opcao_relatorio:int=0):
    if opcao_relatorio == 1:
        relatorio.get_relatorio_agrupamento_vilao()
    elif opcao_relatorio == 2:
        relatorio.get_relatorio_juncao_vilao_arma_veiculo()
    elif opcao_relatorio == 3:
        relatorio.get_relatorio_viloes_por_localizacao()
    elif opcao_relatorio == 4:
        relatorio.get_relatorio_detalhado_vilao_arma_veiculo_localizacao()

def inserir(opcao_inserir:int=0):
    if opcao_inserir == 1:
        ctrl_vilao.inserir_vilao()
    elif opcao_inserir == 2:
        ctrl_arma.inserir_arma()
    elif opcao_inserir == 3:
        ctrl_veiculo.inserir_veiculo()
    elif opcao_inserir == 4:
        ctrl_vilao_arma.inserir_vilao_arma()
    elif opcao_inserir == 5:
        ctrl_vilao_veiculo.inserir_vilao_veiculo()

def atualizar(opcao_atualizar:int=0):
    if opcao_atualizar == 1:
        ctrl_vilao.atualizar_vilao()
    elif opcao_atualizar == 2:
        ctrl_arma.atualizar_arma()
    elif opcao_atualizar == 3:
        ctrl_veiculo.atualizar_veiculo()


def excluir(opcao_excluir:int=0):
    if opcao_excluir == 1:
        ctrl_vilao.excluir_vilao()
    elif opcao_excluir == 2:
        ctrl_arma.excluir_arma()
    elif opcao_excluir == 3:
        ctrl_veiculo.excluir_veiculo()
    elif opcao_excluir == 4:
        ctrl_vilao_arma.excluir_vilao_arma()
    elif opcao_excluir == 5:
        ctrl_vilao_veiculo.excluir_vilao_veiculo()


def main():
    print(tela_inicial.get_updated_screen())
    config.clear_console()

    while True:
        print(config.MENU_PRINCIPAL)
        opcao = int(input("Escolha uma opcao: [1-5]\n"))
        config.clear_console(1)

        if opcao == 1:
            print(config.MENU_RELATORIOS)
            opcao_relatorio = int(input("Escolha uma opcao: [0-4]\n"))
            config.clear_console(1)

            reports(opcao_relatorio)

            config.clear_console(1)
        
        elif opcao == 2:
            print(config.MENU_ENTIDADES)
            opcao_inserir = int(input("Escolha uma opcao: [1-5]:\n"))
            config.clear_console(1)

            inserir(opcao_inserir)

            config.clear_console(1)
            print(tela_inicial.get_updated_screen())
            config.clear_console()
        
        elif opcao == 3:

            print(config.MENU_ATUALIZAR)
            opcao_atualizar = int(input("Escolha uma opção [1-3]:\n"))
            config.clear_console(1)

            atualizar(opcao_atualizar)

            config.clear_console()


        elif opcao == 4:

            print(config.MENU_ENTIDADES)
            opcao_excluir = int(input("Escolha uma opcao: [1-5]:\n"))
            config.clear_console(1)

            excluir(opcao_excluir)

            config.clear_console(1)
            print(tela_inicial.get_updated_screen())
            config.clear_console()

        elif opcao == 5:
            print(tela_inicial.get_updated_screen())
            config.clear_console()
            print("Obrigado por utilizar o Bat Computador\n Tenha um ótimo Bat Dia")
            exit(0)

        else:
            print("Opção invalida, tente novamente")





if __name__ == "__main__":
    main()