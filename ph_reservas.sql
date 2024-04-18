CREATE TABLE Clientes (
    ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Telefone VARCHAR(20),
    Endereco TEXT
);

CREATE TABLE Voos (
    VooID INT AUTO_INCREMENT PRIMARY KEY,
    Origem VARCHAR(100) NOT NULL,
    Destino VARCHAR(100) NOT NULL,
    DataHoraPartida DATETIME NOT NULL,
    DataHoraChegada DATETIME NOT NULL,
    Preco DECIMAL(10, 2) NOT NULL
);

CREATE TABLE ReservasVoos (
    ReservaVooID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    VooID INT,
    DataReserva DATETIME DEFAULT CURRENT_TIMESTAMP,
    StatusReserva ENUM('Confirmada', 'Cancelada') DEFAULT 'Confirmada',
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    FOREIGN KEY (VooID) REFERENCES Voos(VooID)
);

CREATE TABLE Hoteis (
    HotelID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Localizacao VARCHAR(255) NOT NULL,
    Descricao TEXT
);

CREATE TABLE Quartos (
    QuartoID INT AUTO_INCREMENT PRIMARY KEY,
    HotelID INT,
    Tipo ENUM('Single', 'Duplo', 'Suite') NOT NULL,
    PrecoDiaria DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (HotelID) REFERENCES Hoteis(HotelID)
);

CREATE TABLE ReservasQuartos (
    ReservaQuartoID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    QuartoID INT,
    DataEntrada DATE NOT NULL,
    DataSaida DATE NOT NULL,
    StatusReserva ENUM('Confirmada', 'Cancelada') DEFAULT 'Confirmada',
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    FOREIGN KEY (QuartoID) REFERENCES Quartos(QuartoID)
);

CREATE TABLE Pagamentos (
    PagamentoID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    Valor DECIMAL(10, 2) NOT NULL,
    DataPagamento DATETIME DEFAULT CURRENT_TIMESTAMP,
    TipoPagamento ENUM('Cartão de Crédito', 'Boleto', 'Débito') NOT NULL,
    StatusPagamento ENUM('Pago', 'Pendente') DEFAULT 'Pendente',
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);
