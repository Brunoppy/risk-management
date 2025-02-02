-- Sistema de Gestão de Riscos

-- Tabela: riscos
CREATE TABLE riscos (
    risco_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    categoria ENUM('Financeiro', 'Operacional', 'Cibersegurança', 'Conformidade', 'Reputação') NOT NULL,
    nivel_impacto ENUM('Baixo', 'Médio', 'Alto', 'Crítico') NOT NULL,
    probabilidade ENUM('Raro', 'Improvável', 'Possível', 'Provável', 'Quase Certo') NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela: mitigacao_riscos
CREATE TABLE mitigacao_riscos (
    mitigacao_id INT PRIMARY KEY AUTO_INCREMENT,
    risco_id INT,
    estrategia TEXT NOT NULL,
    responsavel VARCHAR(100) NOT NULL,
    status ENUM('Pendente', 'Em Progresso', 'Concluído') DEFAULT 'Pendente',
    FOREIGN KEY (risco_id) REFERENCES riscos(risco_id) ON DELETE CASCADE
);

-- Tabela: auditoria_riscos
CREATE TABLE auditoria_riscos (
    auditoria_id INT PRIMARY KEY AUTO_INCREMENT,
    risco_id INT,
    data_auditoria DATE NOT NULL,
    notas TEXT,
    revisado_por VARCHAR(100) NOT NULL,
    FOREIGN KEY (risco_id) REFERENCES riscos(risco_id) ON DELETE CASCADE
);

-- Inserção de dados de exemplo
INSERT INTO riscos (nome, descricao, categoria, nivel_impacto, probabilidade)
VALUES 
('Vazamento de Dados', 'Possível exposição de informações sensíveis', 'Cibersegurança', 'Crítico', 'Provável'),
('Falência de Fornecedor', 'Possível falência de fornecedor-chave', 'Operacional', 'Alto', 'Possível');

INSERT INTO mitigacao_riscos (risco_id, estrategia, responsavel, status)
VALUES 
(1, 'Implementação de autenticação multifator e criptografia avançada', 'Equipe de Segurança', 'Em Progresso'),
(2, 'Diversificação de fornecedores e contratos alternativos', 'Gerente de Compras', 'Pendente');

INSERT INTO auditoria_riscos (risco_id, data_auditoria, notas, revisado_por)
VALUES 
(1, '2025-02-01', 'Revisão das políticas de segurança de acesso', 'Responsável pela Conformidade de TI'),
(2, '2025-02-01', 'Avaliação da saúde financeira dos fornecedores', 'Departamento Financeiro');
