MENU_PRINCIPAL = """Menu Principal
1 - Relatórios
2 - Inserir Registros
3 - Atualizar Registros
4 - Remover Registros
5 - Sair
"""

MENU_RELATORIOS = """Relatórios
1 - Relatório de contagem de armas e veículos por vilão
2 - Relatório de armas e veiculos associados a cada vilão
3 - Relatório de contagem de vilões por localização
4 - Relatório de detalhamento completo de vilões, armas, veículos e localização
0 - Sair
"""

MENU_ENTIDADES = """ENTIDADES
1 - VILOES
2 - ARMAS
3 - VEICULOS
4 - ARMAS DE VILOES 
5 - VEICULOS DE VILOES
"""

MENU_ATUALIZAR = """ENTIDADES
1 - VILOES
2 - ARMAS
3 - VEICULOS
"""

QUERY_COUNT = 'select count(1) as total_{tabela} from {tabela}'

def clear_console(time:int=3):
    import os
    from time import sleep

    if os.name == "posix":
        command = "clear"
    else:
        command = "cls"

    sleep(time)
    os.system(command)