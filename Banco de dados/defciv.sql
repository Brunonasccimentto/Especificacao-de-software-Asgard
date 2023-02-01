-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 01-Fev-2023 às 02:37
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `asgard`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `abrigo`
--

CREATE TABLE `abrigo` (
  `idabrigo` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `idendereco` int(11) DEFAULT NULL,
  `capacidade` int(11) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `idcolaborador` int(11) DEFAULT NULL,
  `iddefesacivil` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `areaderisco`
--

CREATE TABLE `areaderisco` (
  `idareaderisco` int(11) NOT NULL,
  `descricao` longtext DEFAULT NULL,
  `tipodelocal` varchar(15) NOT NULL,
  `idrisco` int(11) DEFAULT NULL,
  `idendereco` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `beneficiado`
--

CREATE TABLE `beneficiado` (
  `idbeneficiado` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `colaborador`
--

CREATE TABLE `colaborador` (
  `idcolaborador` int(11) NOT NULL,
  `idpessoa` int(11) NOT NULL,
  `cargo` varchar(45) NOT NULL,
  `funcao` varchar(100) NOT NULL,
  `cpf` varchar(15) NOT NULL,
  `idendereco` int(11) NOT NULL,
  `iddefesacivil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='												';

-- --------------------------------------------------------

--
-- Estrutura da tabela `defesacivil`
--

CREATE TABLE `defesacivil` (
  `iddefesacivil` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `esfera` varchar(45) NOT NULL,
  `gestor` varchar(70) DEFAULT NULL,
  `telefone` varchar(20) NOT NULL,
  `idendereco` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `desastre`
--

CREATE TABLE `desastre` (
  `iddesastre` int(11) NOT NULL,
  `idareaderisco` int(11) NOT NULL,
  `categoria` varchar(20) NOT NULL,
  `grupo` varchar(20) NOT NULL,
  `subgrupo` varchar(100) NOT NULL,
  `tipo` varchar(100) DEFAULT '0',
  `subtipo` varchar(30) DEFAULT '0',
  `codigo` varchar(10) NOT NULL,
  `intensidade` varchar(3) NOT NULL,
  `numerovitimas` int(11) DEFAULT NULL,
  `numeroobitos` int(11) DEFAULT NULL,
  `numerodesaparecidos` int(11) DEFAULT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `doacao`
--

CREATE TABLE `doacao` (
  `iddoacao` int(11) NOT NULL,
  `item` varchar(20) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `datadadoacao` date NOT NULL,
  `idkits` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `doacaoespecifica`
--

CREATE TABLE `doacaoespecifica` (
  `iddoacaoespecifica` int(11) NOT NULL,
  `nomeproduto` varchar(45) NOT NULL,
  `descricao` mediumtext NOT NULL,
  `quantidade` int(11) NOT NULL,
  `idbeneficiado` int(11) NOT NULL,
  `datapedido` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `empresaprivada`
--

CREATE TABLE `empresaprivada` (
  `idempresaprivada` int(11) NOT NULL,
  `nome` varchar(70) NOT NULL,
  `cnpj` varchar(20) NOT NULL,
  `areaatuacao` varchar(45) NOT NULL,
  `idendereco` int(11) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE `endereco` (
  `idendereco` int(11) NOT NULL,
  `pais` varchar(45) DEFAULT 'Brasil',
  `idmunicipio` int(11) NOT NULL,
  `bairro` varchar(30) NOT NULL,
  `idtipodelogradouro` int(11) DEFAULT NULL,
  `logradouro` varchar(70) DEFAULT NULL,
  `CEP` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `estado`
--

CREATE TABLE `estado` (
  `idestado` int(11) NOT NULL,
  `UF` varchar(2) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `governador` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `familia`
--

CREATE TABLE `familia` (
  `idfamilia` int(11) NOT NULL,
  `idpessoarepresentante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `kits`
--

CREATE TABLE `kits` (
  `idkits` int(11) NOT NULL,
  `tipo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `localdistribuicaodoacao`
--

CREATE TABLE `localdistribuicaodoacao` (
  `iddistribuicaodoacao` int(11) NOT NULL,
  `idendereco` int(11) NOT NULL,
  `idcolaboradorresponsavel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `morador`
--

CREATE TABLE `morador` (
  `idmorador` int(11) NOT NULL,
  `idpessoa` int(11) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `idendereco` int(11) NOT NULL,
  `idareaderisco` int(11) DEFAULT 0,
  `numeroendereco` varchar(10) DEFAULT NULL,
  `complementoendereco` varchar(200) DEFAULT NULL,
  `idfamilia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `moradoratingidodesastre`
--

CREATE TABLE `moradoratingidodesastre` (
  `idmoradoratingidodesastre` int(11) NOT NULL,
  `iddesastre` int(11) NOT NULL,
  `idmorador` int(11) NOT NULL,
  `idstatusdeseguranca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `municipio`
--

CREATE TABLE `municipio` (
  `idmunicipio` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `prefeito` varchar(70) NOT NULL,
  `idestado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `notificacaoparacelular`
--

CREATE TABLE `notificacaoparacelular` (
  `idnotificacaoparacelular` int(11) NOT NULL,
  `mensagem` mediumtext NOT NULL,
  `niveldealerta` varchar(20) NOT NULL,
  `idmorador` int(11) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ongs`
--

CREATE TABLE `ongs` (
  `idongs` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `idendereco` int(11) NOT NULL,
  `areaatuacao` varchar(45) NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `gestor` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ordemdeservico`
--

CREATE TABLE `ordemdeservico` (
  `idordemdeservico` int(11) NOT NULL,
  `datahora` datetime NOT NULL,
  `titulo` varchar(45) NOT NULL,
  `descricao` mediumtext NOT NULL,
  `numero` int(11) NOT NULL,
  `iddesastre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `orgaogovernamental`
--

CREATE TABLE `orgaogovernamental` (
  `idorgaogovernamental` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `esfera` varchar(10) NOT NULL,
  `gestor` varchar(45) NOT NULL,
  `idendereco` int(11) NOT NULL,
  `telefone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidodedoacao`
--

CREATE TABLE `pedidodedoacao` (
  `idpedidodedoacao` int(11) NOT NULL,
  `dataabertura` date NOT NULL,
  `idenderecorecebimento` int(11) NOT NULL,
  `datafechamento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidodevistoria`
--

CREATE TABLE `pedidodevistoria` (
  `idpedidodevistoria` int(11) NOT NULL,
  `titulo` varchar(70) NOT NULL,
  `idendereco` int(11) NOT NULL,
  `descricao` mediumtext NOT NULL,
  `foto` blob NOT NULL,
  `idstatusvisualizacao` int(11) NOT NULL,
  `idpessoa` int(11) NOT NULL,
  `datadecriacao` date NOT NULL DEFAULT current_timestamp(),
  `datadeatualizacao` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa`
--

CREATE TABLE `pessoa` (
  `idpessoa` int(11) NOT NULL,
  `nome` varchar(70) NOT NULL,
  `sexo` varchar(1) NOT NULL,
  `datanascimento` date NOT NULL,
  `cpf` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `pessoa`
--

INSERT INTO `pessoa` (`idpessoa`, `nome`, `sexo`, `datanascimento`, `cpf`) VALUES
(1, 'jorge', 'm', '1990-03-23', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `receitamedica`
--

CREATE TABLE `receitamedica` (
  `idreceita` int(11) NOT NULL,
  `idpessoa` int(11) NOT NULL,
  `nomemedico` varchar(70) NOT NULL,
  `data` date DEFAULT NULL,
  `crm` varchar(7) NOT NULL,
  `medicamento` varchar(45) NOT NULL,
  `cid` varchar(7) DEFAULT NULL,
  `foto` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `relatoriopedidoedistribuicaodoacao`
--

CREATE TABLE `relatoriopedidoedistribuicaodoacao` (
  `idrelatoriopedidodistribuicaodoacao` int(11) NOT NULL,
  `titulo` varchar(45) NOT NULL,
  `descricao` mediumtext NOT NULL,
  `quantidadedeentrada` int(11) NOT NULL,
  `quantidadedesaida` int(11) NOT NULL,
  `idcolaborador` int(11) NOT NULL,
  `idpedidodedoacao` int(11) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `relatoriovistoria`
--

CREATE TABLE `relatoriovistoria` (
  `idrelatoriovistoria` int(11) NOT NULL,
  `titulo` varchar(45) NOT NULL,
  `descricao` mediumtext NOT NULL,
  `foto` blob DEFAULT NULL,
  `idpedidodevistoria` int(11) DEFAULT NULL,
  `idcolaborador` int(11) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `risco`
--

CREATE TABLE `risco` (
  `idrisco` int(11) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `grau` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `site`
--

CREATE TABLE `site` (
  `idsite` int(11) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `url` varchar(70) NOT NULL,
  `descricao` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `statusdeseguranca`
--

CREATE TABLE `statusdeseguranca` (
  `idstatusdeseguranca` int(11) NOT NULL,
  `status` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `statusvisualizacao`
--

CREATE TABLE `statusvisualizacao` (
  `idstatusvisualizacao` int(11) NOT NULL,
  `status` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipodelogradouro`
--

CREATE TABLE `tipodelogradouro` (
  `idtipodelogradouro` int(11) NOT NULL,
  `tipo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipopermissao`
--

CREATE TABLE `tipopermissao` (
  `idtipopermissao` int(11) NOT NULL,
  `tipo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `senha` varchar(25) DEFAULT NULL,
  `idpessoa` int(11) NOT NULL,
  `idtipopermissao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `voluntario`
--

CREATE TABLE `voluntario` (
  `idvoluntario` int(11) NOT NULL,
  `idpessoa` int(11) NOT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `cpf` varchar(15) NOT NULL,
  `iddefesacivil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `abrigo`
--
ALTER TABLE `abrigo`
  ADD PRIMARY KEY (`idabrigo`),
  ADD KEY `idcolaborador` (`idcolaborador`),
  ADD KEY `abrigo_FK` (`idendereco`);

--
-- Índices para tabela `areaderisco`
--
ALTER TABLE `areaderisco`
  ADD PRIMARY KEY (`idareaderisco`),
  ADD KEY `idrisco_fk` (`idrisco`),
  ADD KEY `idendereco_fk` (`idendereco`);

--
-- Índices para tabela `beneficiado`
--
ALTER TABLE `beneficiado`
  ADD PRIMARY KEY (`idbeneficiado`),
  ADD KEY `beneficiado_FK` (`idusuario`);

--
-- Índices para tabela `colaborador`
--
ALTER TABLE `colaborador`
  ADD PRIMARY KEY (`idcolaborador`),
  ADD KEY `idpessoa_fk` (`idpessoa`),
  ADD KEY `idendereco_fk` (`idendereco`),
  ADD KEY `iddefesacivil_fk` (`iddefesacivil`);

--
-- Índices para tabela `defesacivil`
--
ALTER TABLE `defesacivil`
  ADD PRIMARY KEY (`iddefesacivil`),
  ADD KEY `defesacivil_FK` (`idendereco`);

--
-- Índices para tabela `desastre`
--
ALTER TABLE `desastre`
  ADD PRIMARY KEY (`iddesastre`),
  ADD KEY `desastre_FK` (`idareaderisco`);

--
-- Índices para tabela `doacao`
--
ALTER TABLE `doacao`
  ADD PRIMARY KEY (`iddoacao`),
  ADD KEY `doacao_FK` (`idkits`);

--
-- Índices para tabela `doacaoespecifica`
--
ALTER TABLE `doacaoespecifica`
  ADD PRIMARY KEY (`iddoacaoespecifica`),
  ADD KEY `doacaoespecifica_FK` (`idbeneficiado`);

--
-- Índices para tabela `empresaprivada`
--
ALTER TABLE `empresaprivada`
  ADD PRIMARY KEY (`idempresaprivada`),
  ADD KEY `empresaprivada_FK` (`idendereco`);

--
-- Índices para tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`idendereco`),
  ADD KEY `endereco_FK` (`idtipodelogradouro`),
  ADD KEY `endereco_FK_1` (`idmunicipio`);

--
-- Índices para tabela `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`idestado`);

--
-- Índices para tabela `familia`
--
ALTER TABLE `familia`
  ADD PRIMARY KEY (`idfamilia`),
  ADD KEY `familia_FK` (`idpessoarepresentante`);

--
-- Índices para tabela `kits`
--
ALTER TABLE `kits`
  ADD PRIMARY KEY (`idkits`);

--
-- Índices para tabela `localdistribuicaodoacao`
--
ALTER TABLE `localdistribuicaodoacao`
  ADD PRIMARY KEY (`iddistribuicaodoacao`),
  ADD KEY `distribuicaodoacao_FK_1` (`idendereco`),
  ADD KEY `distribuicaodoacao_FK` (`idcolaboradorresponsavel`);

--
-- Índices para tabela `morador`
--
ALTER TABLE `morador`
  ADD PRIMARY KEY (`idmorador`),
  ADD KEY `idpessoa_fk` (`idpessoa`),
  ADD KEY `morador_FK_1` (`idendereco`),
  ADD KEY `morador_FK_2` (`idareaderisco`),
  ADD KEY `morador_FK_3` (`idfamilia`);

--
-- Índices para tabela `moradoratingidodesastre`
--
ALTER TABLE `moradoratingidodesastre`
  ADD PRIMARY KEY (`idmoradoratingidodesastre`),
  ADD KEY `moradoratingidodesastre_FK` (`iddesastre`),
  ADD KEY `moradoratingidodesastre_FK_1` (`idstatusdeseguranca`),
  ADD KEY `moradoratingidodesastre_FK_2` (`idmorador`);

--
-- Índices para tabela `municipio`
--
ALTER TABLE `municipio`
  ADD PRIMARY KEY (`idmunicipio`),
  ADD KEY `municipio_ibfk_1` (`idestado`);

--
-- Índices para tabela `notificacaoparacelular`
--
ALTER TABLE `notificacaoparacelular`
  ADD PRIMARY KEY (`idnotificacaoparacelular`),
  ADD KEY `notificacaoparacelular_FK` (`idmorador`);

--
-- Índices para tabela `ongs`
--
ALTER TABLE `ongs`
  ADD PRIMARY KEY (`idongs`),
  ADD KEY `ongs_FK` (`idendereco`);

--
-- Índices para tabela `ordemdeservico`
--
ALTER TABLE `ordemdeservico`
  ADD PRIMARY KEY (`idordemdeservico`),
  ADD KEY `ordemdeservico_FK` (`iddesastre`);

--
-- Índices para tabela `orgaogovernamental`
--
ALTER TABLE `orgaogovernamental`
  ADD PRIMARY KEY (`idorgaogovernamental`),
  ADD KEY `orgaogovernamental_FK` (`idendereco`);

--
-- Índices para tabela `pedidodedoacao`
--
ALTER TABLE `pedidodedoacao`
  ADD PRIMARY KEY (`idpedidodedoacao`),
  ADD KEY `pedidodedoacao_FK` (`idenderecorecebimento`);

--
-- Índices para tabela `pedidodevistoria`
--
ALTER TABLE `pedidodevistoria`
  ADD PRIMARY KEY (`idpedidodevistoria`),
  ADD KEY `pedidodevistoria_FK` (`idendereco`),
  ADD KEY `pedidodevistoria_FK_1` (`idstatusvisualizacao`),
  ADD KEY `pedidodevistoria_FK_2` (`idpessoa`);

--
-- Índices para tabela `pessoa`
--
ALTER TABLE `pessoa`
  ADD PRIMARY KEY (`idpessoa`);

--
-- Índices para tabela `receitamedica`
--
ALTER TABLE `receitamedica`
  ADD PRIMARY KEY (`idreceita`),
  ADD KEY `receitamedica_FK` (`idpessoa`);

--
-- Índices para tabela `relatoriopedidoedistribuicaodoacao`
--
ALTER TABLE `relatoriopedidoedistribuicaodoacao`
  ADD PRIMARY KEY (`idrelatoriopedidodistribuicaodoacao`),
  ADD KEY `relatoriopedidodistribuicaodoacao_FK` (`idcolaborador`),
  ADD KEY `relatoriopedidodistribuicaodoacao_FK_1` (`idpedidodedoacao`);

--
-- Índices para tabela `relatoriovistoria`
--
ALTER TABLE `relatoriovistoria`
  ADD PRIMARY KEY (`idrelatoriovistoria`),
  ADD KEY `relatoriovistoria_FK` (`idpedidodevistoria`),
  ADD KEY `relatoriovistoria_FK_1` (`idcolaborador`);

--
-- Índices para tabela `risco`
--
ALTER TABLE `risco`
  ADD PRIMARY KEY (`idrisco`);

--
-- Índices para tabela `site`
--
ALTER TABLE `site`
  ADD PRIMARY KEY (`idsite`);

--
-- Índices para tabela `statusdeseguranca`
--
ALTER TABLE `statusdeseguranca`
  ADD PRIMARY KEY (`idstatusdeseguranca`);

--
-- Índices para tabela `statusvisualizacao`
--
ALTER TABLE `statusvisualizacao`
  ADD PRIMARY KEY (`idstatusvisualizacao`);

--
-- Índices para tabela `tipodelogradouro`
--
ALTER TABLE `tipodelogradouro`
  ADD PRIMARY KEY (`idtipodelogradouro`);

--
-- Índices para tabela `tipopermissao`
--
ALTER TABLE `tipopermissao`
  ADD PRIMARY KEY (`idtipopermissao`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD KEY `usuario_FK` (`idpessoa`),
  ADD KEY `usuario_FK_1` (`idtipopermissao`);

--
-- Índices para tabela `voluntario`
--
ALTER TABLE `voluntario`
  ADD PRIMARY KEY (`idvoluntario`),
  ADD KEY `voluntario_FK` (`idpessoa`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `abrigo`
--
ALTER TABLE `abrigo`
  MODIFY `idabrigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `areaderisco`
--
ALTER TABLE `areaderisco`
  MODIFY `idareaderisco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `beneficiado`
--
ALTER TABLE `beneficiado`
  MODIFY `idbeneficiado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `colaborador`
--
ALTER TABLE `colaborador`
  MODIFY `idcolaborador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `defesacivil`
--
ALTER TABLE `defesacivil`
  MODIFY `iddefesacivil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `desastre`
--
ALTER TABLE `desastre`
  MODIFY `iddesastre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `doacao`
--
ALTER TABLE `doacao`
  MODIFY `iddoacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `doacaoespecifica`
--
ALTER TABLE `doacaoespecifica`
  MODIFY `iddoacaoespecifica` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `endereco`
--
ALTER TABLE `endereco`
  MODIFY `idendereco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `estado`
--
ALTER TABLE `estado`
  MODIFY `idestado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `familia`
--
ALTER TABLE `familia`
  MODIFY `idfamilia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `kits`
--
ALTER TABLE `kits`
  MODIFY `idkits` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `localdistribuicaodoacao`
--
ALTER TABLE `localdistribuicaodoacao`
  MODIFY `iddistribuicaodoacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `morador`
--
ALTER TABLE `morador`
  MODIFY `idmorador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `moradoratingidodesastre`
--
ALTER TABLE `moradoratingidodesastre`
  MODIFY `idmoradoratingidodesastre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `municipio`
--
ALTER TABLE `municipio`
  MODIFY `idmunicipio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `notificacaoparacelular`
--
ALTER TABLE `notificacaoparacelular`
  MODIFY `idnotificacaoparacelular` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ongs`
--
ALTER TABLE `ongs`
  MODIFY `idongs` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ordemdeservico`
--
ALTER TABLE `ordemdeservico`
  MODIFY `idordemdeservico` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `orgaogovernamental`
--
ALTER TABLE `orgaogovernamental`
  MODIFY `idorgaogovernamental` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `pedidodedoacao`
--
ALTER TABLE `pedidodedoacao`
  MODIFY `idpedidodedoacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedidodevistoria`
--
ALTER TABLE `pedidodevistoria`
  MODIFY `idpedidodevistoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `pessoa`
--
ALTER TABLE `pessoa`
  MODIFY `idpessoa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de tabela `receitamedica`
--
ALTER TABLE `receitamedica`
  MODIFY `idreceita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `relatoriopedidoedistribuicaodoacao`
--
ALTER TABLE `relatoriopedidoedistribuicaodoacao`
  MODIFY `idrelatoriopedidodistribuicaodoacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `relatoriovistoria`
--
ALTER TABLE `relatoriovistoria`
  MODIFY `idrelatoriovistoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `risco`
--
ALTER TABLE `risco`
  MODIFY `idrisco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `site`
--
ALTER TABLE `site`
  MODIFY `idsite` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `statusdeseguranca`
--
ALTER TABLE `statusdeseguranca`
  MODIFY `idstatusdeseguranca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `statusvisualizacao`
--
ALTER TABLE `statusvisualizacao`
  MODIFY `idstatusvisualizacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tipodelogradouro`
--
ALTER TABLE `tipodelogradouro`
  MODIFY `idtipodelogradouro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de tabela `tipopermissao`
--
ALTER TABLE `tipopermissao`
  MODIFY `idtipopermissao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `voluntario`
--
ALTER TABLE `voluntario`
  MODIFY `idvoluntario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `abrigo`
--
ALTER TABLE `abrigo`
  ADD CONSTRAINT `abrigo_FK` FOREIGN KEY (`idendereco`) REFERENCES `endereco` (`idendereco`),
  ADD CONSTRAINT `idcolaborador` FOREIGN KEY (`idcolaborador`) REFERENCES `colaborador` (`idcolaborador`);

--
-- Limitadores para a tabela `areaderisco`
--
ALTER TABLE `areaderisco`
  ADD CONSTRAINT `idendereco_fk` FOREIGN KEY (`idendereco`) REFERENCES `endereco` (`idendereco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idrisco_fk` FOREIGN KEY (`idrisco`) REFERENCES `risco` (`idrisco`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `beneficiado`
--
ALTER TABLE `beneficiado`
  ADD CONSTRAINT `beneficiado_FK` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Limitadores para a tabela `colaborador`
--
ALTER TABLE `colaborador`
  ADD CONSTRAINT `colaborador_FK` FOREIGN KEY (`idendereco`) REFERENCES `endereco` (`idendereco`),
  ADD CONSTRAINT `iddefesacivl` FOREIGN KEY (`iddefesacivil`) REFERENCES `defesacivil` (`iddefesacivil`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idpessoa_fk` FOREIGN KEY (`idpessoa`) REFERENCES `pessoa` (`idpessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `defesacivil`
--
ALTER TABLE `defesacivil`
  ADD CONSTRAINT `defesacivil_FK` FOREIGN KEY (`idendereco`) REFERENCES `endereco` (`idendereco`);

--
-- Limitadores para a tabela `desastre`
--
ALTER TABLE `desastre`
  ADD CONSTRAINT `desastre_FK` FOREIGN KEY (`idareaderisco`) REFERENCES `areaderisco` (`idareaderisco`);

--
-- Limitadores para a tabela `doacao`
--
ALTER TABLE `doacao`
  ADD CONSTRAINT `doacao_FK` FOREIGN KEY (`idkits`) REFERENCES `kits` (`idkits`);

--
-- Limitadores para a tabela `doacaoespecifica`
--
ALTER TABLE `doacaoespecifica`
  ADD CONSTRAINT `doacaoespecifica_FK` FOREIGN KEY (`idbeneficiado`) REFERENCES `beneficiado` (`idbeneficiado`);

--
-- Limitadores para a tabela `empresaprivada`
--
ALTER TABLE `empresaprivada`
  ADD CONSTRAINT `empresaprivada_FK` FOREIGN KEY (`idendereco`) REFERENCES `endereco` (`idendereco`);

--
-- Limitadores para a tabela `endereco`
--
ALTER TABLE `endereco`
  ADD CONSTRAINT `endereco_FK` FOREIGN KEY (`idtipodelogradouro`) REFERENCES `tipodelogradouro` (`idtipodelogradouro`),
  ADD CONSTRAINT `endereco_FK_1` FOREIGN KEY (`idmunicipio`) REFERENCES `municipio` (`idmunicipio`);

--
-- Limitadores para a tabela `familia`
--
ALTER TABLE `familia`
  ADD CONSTRAINT `familia_FK` FOREIGN KEY (`idpessoarepresentante`) REFERENCES `pessoa` (`idpessoa`);

--
-- Limitadores para a tabela `localdistribuicaodoacao`
--
ALTER TABLE `localdistribuicaodoacao`
  ADD CONSTRAINT `distribuicaodoacao_FK` FOREIGN KEY (`idcolaboradorresponsavel`) REFERENCES `colaborador` (`idcolaborador`),
  ADD CONSTRAINT `distribuicaodoacao_FK_1` FOREIGN KEY (`idendereco`) REFERENCES `endereco` (`idendereco`);

--
-- Limitadores para a tabela `morador`
--
ALTER TABLE `morador`
  ADD CONSTRAINT `morador_FK` FOREIGN KEY (`idpessoa`) REFERENCES `pessoa` (`idpessoa`),
  ADD CONSTRAINT `morador_FK_1` FOREIGN KEY (`idendereco`) REFERENCES `endereco` (`idendereco`),
  ADD CONSTRAINT `morador_FK_2` FOREIGN KEY (`idareaderisco`) REFERENCES `areaderisco` (`idareaderisco`),
  ADD CONSTRAINT `morador_FK_3` FOREIGN KEY (`idfamilia`) REFERENCES `familia` (`idfamilia`);

--
-- Limitadores para a tabela `moradoratingidodesastre`
--
ALTER TABLE `moradoratingidodesastre`
  ADD CONSTRAINT `moradoratingidodesastre_FK` FOREIGN KEY (`iddesastre`) REFERENCES `desastre` (`iddesastre`),
  ADD CONSTRAINT `moradoratingidodesastre_FK_1` FOREIGN KEY (`idstatusdeseguranca`) REFERENCES `statusdeseguranca` (`idstatusdeseguranca`),
  ADD CONSTRAINT `moradoratingidodesastre_FK_2` FOREIGN KEY (`idmorador`) REFERENCES `morador` (`idmorador`);

--
-- Limitadores para a tabela `municipio`
--
ALTER TABLE `municipio`
  ADD CONSTRAINT `municipio_ibfk_1` FOREIGN KEY (`idestado`) REFERENCES `estado` (`idestado`);

--
-- Limitadores para a tabela `notificacaoparacelular`
--
ALTER TABLE `notificacaoparacelular`
  ADD CONSTRAINT `notificacaoparacelular_FK` FOREIGN KEY (`idmorador`) REFERENCES `morador` (`idmorador`);

--
-- Limitadores para a tabela `ongs`
--
ALTER TABLE `ongs`
  ADD CONSTRAINT `ongs_FK` FOREIGN KEY (`idendereco`) REFERENCES `endereco` (`idendereco`);

--
-- Limitadores para a tabela `ordemdeservico`
--
ALTER TABLE `ordemdeservico`
  ADD CONSTRAINT `ordemdeservico_FK` FOREIGN KEY (`iddesastre`) REFERENCES `desastre` (`iddesastre`);

--
-- Limitadores para a tabela `orgaogovernamental`
--
ALTER TABLE `orgaogovernamental`
  ADD CONSTRAINT `orgaogovernamental_FK` FOREIGN KEY (`idendereco`) REFERENCES `endereco` (`idendereco`);

--
-- Limitadores para a tabela `pedidodedoacao`
--
ALTER TABLE `pedidodedoacao`
  ADD CONSTRAINT `pedidodedoacao_FK` FOREIGN KEY (`idenderecorecebimento`) REFERENCES `endereco` (`idendereco`);

--
-- Limitadores para a tabela `pedidodevistoria`
--
ALTER TABLE `pedidodevistoria`
  ADD CONSTRAINT `pedidodevistoria_FK` FOREIGN KEY (`idendereco`) REFERENCES `endereco` (`idendereco`),
  ADD CONSTRAINT `pedidodevistoria_FK_1` FOREIGN KEY (`idstatusvisualizacao`) REFERENCES `statusvisualizacao` (`idstatusvisualizacao`),
  ADD CONSTRAINT `pedidodevistoria_FK_2` FOREIGN KEY (`idpessoa`) REFERENCES `pessoa` (`idpessoa`);

--
-- Limitadores para a tabela `receitamedica`
--
ALTER TABLE `receitamedica`
  ADD CONSTRAINT `receitamedica_FK` FOREIGN KEY (`idpessoa`) REFERENCES `pessoa` (`idpessoa`);

--
-- Limitadores para a tabela `relatoriopedidoedistribuicaodoacao`
--
ALTER TABLE `relatoriopedidoedistribuicaodoacao`
  ADD CONSTRAINT `relatoriopedidodistribuicaodoacao_FK` FOREIGN KEY (`idcolaborador`) REFERENCES `colaborador` (`idcolaborador`),
  ADD CONSTRAINT `relatoriopedidodistribuicaodoacao_FK_1` FOREIGN KEY (`idpedidodedoacao`) REFERENCES `pedidodedoacao` (`idpedidodedoacao`);

--
-- Limitadores para a tabela `relatoriovistoria`
--
ALTER TABLE `relatoriovistoria`
  ADD CONSTRAINT `relatoriovistoria_FK` FOREIGN KEY (`idpedidodevistoria`) REFERENCES `pedidodevistoria` (`idpedidodevistoria`),
  ADD CONSTRAINT `relatoriovistoria_FK_1` FOREIGN KEY (`idcolaborador`) REFERENCES `colaborador` (`idcolaborador`);

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_FK` FOREIGN KEY (`idpessoa`) REFERENCES `pessoa` (`idpessoa`),
  ADD CONSTRAINT `usuario_FK_1` FOREIGN KEY (`idtipopermissao`) REFERENCES `tipopermissao` (`idtipopermissao`);

--
-- Limitadores para a tabela `voluntario`
--
ALTER TABLE `voluntario`
  ADD CONSTRAINT `voluntario_FK` FOREIGN KEY (`idpessoa`) REFERENCES `pessoa` (`idpessoa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
