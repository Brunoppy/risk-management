-- Risk Management System

-- Table: risks
CREATE TABLE risks (
    risk_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    category ENUM('Finance', 'Operational', 'Cybersecurity', 'Compliance', 'Reputation') NOT NULL,
    impact_level ENUM('Low', 'Medium', 'High', 'Critical') NOT NULL,
    likelihood ENUM('Rare', 'Unlikely', 'Possible', 'Likely', 'Almost Certain') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: risk_mitigation
CREATE TABLE risk_mitigation (
    mitigation_id INT PRIMARY KEY AUTO_INCREMENT,
    risk_id INT,
    strategy TEXT NOT NULL,
    responsible_person VARCHAR(100) NOT NULL,
    status ENUM('Pending', 'In Progress', 'Completed') DEFAULT 'Pending',
    FOREIGN KEY (risk_id) REFERENCES risks(risk_id) ON DELETE CASCADE
);

-- Table: risk_audit
CREATE TABLE risk_audit (
    audit_id INT PRIMARY KEY AUTO_INCREMENT,
    risk_id INT,
    audit_date DATE NOT NULL,
    audit_notes TEXT,
    reviewed_by VARCHAR(100) NOT NULL,
    FOREIGN KEY (risk_id) REFERENCES risks(risk_id) ON DELETE CASCADE
);

-- Sample Data
INSERT INTO risks (name, description, category, impact_level, likelihood)
VALUES 
('Data Breach', 'Potential exposure of sensitive information', 'Cybersecurity', 'Critical', 'Likely'),
('Supplier Bankruptcy', 'Possible bankruptcy of key suppliers', 'Operational', 'High', 'Possible');

INSERT INTO risk_mitigation (risk_id, strategy, responsible_person, status)
VALUES 
(1, 'Implement multi-factor authentication and advanced encryption', 'Security Team', 'In Progress'),
(2, 'Diversify suppliers and establish alternative contracts', 'Procurement Manager', 'Pending');

INSERT INTO risk_audit (risk_id, audit_date, audit_notes, reviewed_by)
VALUES 
(1, '2025-02-01', 'Review of access security policies', 'IT Compliance Officer'),
(2, '2025-02-01', 'Evaluation of financial health of suppliers', 'Finance Department');
