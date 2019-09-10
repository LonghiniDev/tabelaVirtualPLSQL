CREATE TABLE virtual(
cod   NUMBER,
nome  VARCHAR2(60),
sobrenome VARCHAR2(60),
salario NUMBER(9,2),
comissao1 NUMBER(3),
comissao2 NUMBER(3),
salario1 AS(ROUND(SALARIO*(1+comissao1/100),2)),
CONSTRAINT pk_virtual PRIMARY KEY(cod)
); -- Criando a tabela VIRTUAL
--ADICIONANDO umas nova coluna ALTER TABLE
ALTER TABLE VIRTUAL ADD NOMECOMPLETO AS (F_VIR(NOME,SOBRENOME));
-- ------------------------------------------------------------------
SELECT * FROM virtual;

-- Função para concatenar duas colunas de CHAR
CREATE OR REPLACE FUNCTION F_VIR(pNome IN VARCHAR2,pSobrenome IN VARCHAR2)
      RETURN VARCHAR2 DETERMINISTIC AS
      
BEGIN
    RETURN pNome || ' ' || pSobrenome;
END;
-- -------------------------------------------------

INSERT INTO VIRTUAL (cod,nome,sobrenome)
      VALUES(123,'Eric',' William');
      
SELECT NOMECOMPLETO
      FROM VIRTUAL;
      
-- ----------------------------------------      
-- Select que traz tabelas filtradas
SELECT * FROM (SELECT CD_DEPTO, NR_CARGO
      FROM FUNC F
)
PIVOT(
  COUNT(NR_CARGO)
  FOR  NR_CARGO IN(54,42,43,53)
)
ORDER BY CD_DEPTO;

-- Criando table com Select, adicionando CREATE TABLE nome AS select...      
CREATE TABLE TAB_PIVO AS      
SELECT * FROM (SELECT CD_DEPTO, NR_CARGO
      FROM FUNC F
)
PIVOT(
  COUNT(NR_CARGO)
  FOR  NR_CARGO IN(54,42,43,53)
);
ORDER BY CD_DEPTO;

SELECT * FROM TAB_PIVO;
