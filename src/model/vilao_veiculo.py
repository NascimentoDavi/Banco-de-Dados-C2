class VilaoVeiculo:
    def __init__(self, 
                 vilao_id:int=None, 
                 veiculo_id:int=None):
        self.set_vilao_id(vilao_id)
        self.set_veiculo_id(veiculo_id)

    def set_vilao_id(self, vilao_id:int):
        self.vilao_id = vilao_id

    def set_veiculo_id(self, veiculo_id:int):
        self.veiculo_id = veiculo_id

    def get_vilao_id(self) -> int:
        return self.vilao_id

    def get_veiculo_id(self) -> int:
        return self.veiculo_id

    def to_string(self) -> str:
        return f"Vilão ID: {self.get_vilao_id()} | Veículo ID: {self.get_veiculo_id()}"
