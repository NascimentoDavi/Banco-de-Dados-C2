class Veiculo:
    def __init__(self, 
                 id_veiculo:int=None, 
                 tipo_veiculo:str=None, 
                 descricao_veiculo:str=None):
        self.set_id_veiculo(id_veiculo)
        self.set_tipo_veiculo(tipo_veiculo)
        self.set_descricao_veiculo(descricao_veiculo)

    def set_id_veiculo(self, id_veiculo:int):
        self.id_veiculo = id_veiculo

    def set_tipo_veiculo(self, tipo_veiculo:str):
        self.tipo_veiculo = tipo_veiculo

    def set_descricao_veiculo(self, descricao_veiculo:str):
        self.descricao_veiculo = descricao_veiculo

    def get_id_veiculo(self) -> int:
        return self.id_veiculo

    def get_tipo_veiculo(self) -> str:
        return self.tipo_veiculo

    def get_descricao_veiculo(self) -> str:
        return self.descricao_veiculo

    def to_string(self) -> str:
        return f"Veículo: {self.get_tipo_veiculo()} | Descrição: {self.get_descricao_veiculo()}"
