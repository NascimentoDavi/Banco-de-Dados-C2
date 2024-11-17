class Arma:
    def __init__(self, 
                 id_arma:int=None, 
                 tipo_arma:str=None, 
                 descricao_arma:str=None):
        self.set_id_arma(id_arma)
        self.set_tipo_arma(tipo_arma)
        self.set_descricao_arma(descricao_arma)

    def set_id_arma(self, id_arma:int):
        self.id_arma = id_arma

    def set_tipo_arma(self, tipo_arma:str):
        self.tipo_arma = tipo_arma

    def set_descricao_arma(self, descricao_arma:str):
        self.descricao_arma = descricao_arma

    def get_id_arma(self) -> int:
        return self.id_arma

    def get_tipo_arma(self) -> str:
        return self.tipo_arma

    def get_descricao_arma(self) -> str:
        return self.descricao_arma

    def to_string(self) -> str:
        return f"Arma: {self.get_tipo_arma()} | Descrição: {self.get_descricao_arma()}"
