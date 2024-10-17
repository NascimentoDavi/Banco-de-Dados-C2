class VilaoArma:
    def __init__(self, 
                 vilao_id:int=None, 
                 arma_id:int=None):
        self.set_vilao_id(vilao_id)
        self.set_arma_id(arma_id)

    def set_vilao_id(self, vilao_id:int):
        self.vilao_id = vilao_id

    def set_arma_id(self, arma_id:int):
        self.arma_id = arma_id

    def get_vilao_id(self) -> int:
        return self.vilao_id

    def get_arma_id(self) -> int:
        return self.arma_id

    def to_string(self) -> str:
        return f"Vilão ID: {self.get_vilao_id()} | Arma ID: {self.get_arma_id()}"
