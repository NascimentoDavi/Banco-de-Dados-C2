class Vilao:
    def __init__(self, 
                 id_vilao:int=None, 
                 nome_vilao:str=None, 
                 nome_verdadeiro:str=None, 
                 localizacao=None, 
                 nivel_periculosidade:str=None):
        self.set_id_vilao(id_vilao)
        self.set_nome_vilao(nome_vilao)
        self.set_nome_verdadeiro(nome_verdadeiro)
        self.set_localizacao(localizacao)
        self.set_nivel_periculosidade(nivel_periculosidade)

    def set_id_vilao(self, id_vilao:int):
        self.id_vilao = id_vilao

    def set_nome_vilao(self, nome_vilao:str):
        self.nome_vilao = nome_vilao

    def set_nome_verdadeiro(self, nome_verdadeiro:str):
        self.nome_verdadeiro = nome_verdadeiro

    def set_localizacao(self, localizacao):
        self.localizacao = localizacao

    def set_nivel_periculosidade(self, nivel_periculosidade:str):
        self.nivel_periculosidade = nivel_periculosidade

    def get_id_vilao(self) -> int:
        return self.id_vilao

    def get_nome_vilao(self) -> str:
        return self.nome_vilao

    def get_nome_verdadeiro(self) -> str:
        return self.nome_verdadeiro

    def get_localizacao(self):
        return self.localizacao

    def get_nivel_periculosidade(self) -> str:
        return self.nivel_periculosidade

    def to_string(self) -> str:
        return f"Vilão: {self.get_nome_vilao()} | Nome Verdadeiro: {self.get_nome_verdadeiro()} | Localização: {self.get_localizacao().get_nome_localizacao()} | Periculosidade: {self.get_nivel_periculosidade()}"
