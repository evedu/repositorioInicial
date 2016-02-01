/*
SQLyog Community Edition- MySQL GUI v6.13
MySQL - 5.0.41-community-nt : Database - ag2008groupwear
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `ag2008groupwear`;

USE `ag2008groupwear`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `areas` */

DROP TABLE IF EXISTS `areas`;

CREATE TABLE `areas` (
  `codCent` int(3) NOT NULL default '0',
  `descArea` varchar(6) default NULL,
  `descCompleta` varchar(40) default NULL,
  PRIMARY KEY  (`codCent`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `areas` */

LOCK TABLES `areas` WRITE;

insert  into `areas`(`codCent`,`descArea`,`descCompleta`) values (1,'CHS','Ciências Humanas e Sociais'),(2,'CETEC','Ciências Exatas e Tecnológicas'),(3,'CBS','Ciências Biol. e da Saúde'),(4,'CAN','Ciências Administrativas e de Neg.');

UNLOCK TABLES;

/*Table structure for table `categorias` */

DROP TABLE IF EXISTS `categorias`;

CREATE TABLE `categorias` (
  `codigo` varchar(11) NOT NULL default '',
  `categoria` varchar(100) default NULL,
  PRIMARY KEY  (`codigo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `categorias` */

LOCK TABLES `categorias` WRITE;

insert  into `categorias`(`codigo`,`categoria`) values ('1','Missão / Políticas Institucionais'),('2','Organização e Gestão Institucional'),('3','Infra-estrutura Institucional / Acadêmica'),('4','Condições para o Ensino'),('5','Avaliação do Corpo Docente'),('6','Políticas de Pessoal'),('7','Órgãos Colegiados / Conselhos Superiores'),('8','Avaliação do Corpo Discente'),('9','Avaliação Institucional');

UNLOCK TABLES;

/*Table structure for table `colabareas` */

DROP TABLE IF EXISTS `colabareas`;

CREATE TABLE `colabareas` (
  `login` varchar(6) NOT NULL default '',
  `senha` varchar(15) NOT NULL default '',
  `codArea` int(3) NOT NULL default '0',
  `abrevArea` varchar(120) default NULL,
  `descArea` varchar(120) default NULL,
  `permissao` int(3) default NULL,
  `codCent` int(3) default NULL,
  `nomeColab` varchar(120) default NULL,
  PRIMARY KEY  (`login`),
  KEY `FK_colabareas` (`codArea`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `colabareas` */

LOCK TABLES `colabareas` WRITE;

insert  into `colabareas`(`login`,`senha`,`codArea`,`abrevArea`,`descArea`,`permissao`,`codCent`,`nomeColab`) values ('1112','ledon',0,'Administrador do sistema','Administrador do sistema',10,0,'Administrador do sistema'),('121347','hxdbea',1,'Magali Elisabete Sparano','Magali Elisabete Sparano',1,1,'Magali Elisabete Sparano'),('801','w5rbg7',1,'Colaborador 1','Colaborador 1',0,1,'Colaborador 1'),('802','purb7k',1,'Colaborador 2','Colaborador 2',0,1,'Colaborador 2'),('803','f5rbeb',1,'Colaborador 3','Colaborador 3',0,1,'Colaborador 3'),('804','d9rb73',1,'Colaborador 4','Colaborador 4',0,1,'Colaborador 4'),('120873','zvdbgr',2,'Rômulo Pereira Nascimento','Rômulo Pereira Nascimento',1,1,'Rômulo Pereira Nascimento'),('805','qdrb5z',2,'Colaborador 1','Colaborador 1',0,1,'Colaborador 1'),('806','w5rbf7',2,'Colaborador 2','Colaborador 2',0,1,'Colaborador 2'),('807','purbdk',2,'Colaborador 3','Colaborador 3',0,1,'Colaborador 3'),('808','f5rbdb',2,'Colaborador 4','Colaborador 4',0,1,'Colaborador 4'),('123544','qddbez',3,'Janete Fátima Mendonça','Janete Fátima Mendonça',1,4,'Janete Fátima Mendonça'),('809','d9rbg3',3,'Colaborador 1','Colaborador 1',0,4,'Colaborador 1'),('810','qdrb7z',3,'Colaborador 2','Colaborador 2',0,4,'Colaborador 2'),('811','w5rcc7',3,'Colaborador 3','Colaborador 3',0,4,'Colaborador 3'),('812','purckk',3,'Colaborador 4','Colaborador 4',0,4,'Colaborador 4'),('120502','w5dbd7',4,'José Carlos de Souza Lima','José Carlos de Souza Lima',1,4,'José Carlos de Souza Lima'),('813','f5rc5b',4,'Colaborador 1','Colaborador 1',0,4,'Colaborador 1'),('814','d9rcf3',4,'Colaborador 2','Colaborador 2',0,4,'Colaborador 2'),('815','qdrcdz',4,'Colaborador 3','Colaborador 3',0,4,'Colaborador 3'),('816','w5rce7',4,'Colaborador 4','Colaborador 4',0,4,'Colaborador 4'),('120729','qjdbdu',5,'Claudemir Nunes Ferreira','Claudemir Nunes Ferreira',1,1,'Claudemir Nunes Ferreira'),('817','purc7k',5,'Colaborador 1','Colaborador 1',0,1,'Colaborador 1'),('818','f5rc7b',5,'Colaborador 2','Colaborador 2',0,1,'Colaborador 2'),('819','d9rcc3',5,'Colaborador 3','Colaborador 3',0,1,'Colaborador 3'),('820','qdrckz',5,'Colaborador 4','Colaborador 4',0,1,'Colaborador 4'),('122869','qjdbgu',6,'Adriano de Assis Ferreira','Adriano de Assis Ferreira',1,1,'Adriano de Assis Ferreira'),('821','w5r2d7',6,'Colaborador 1','Colaborador 1',0,1,'Colaborador 1'),('822','pur2gk',6,'Colaborador 2','Colaborador 2',0,1,'Colaborador 2'),('823','f5r2db',6,'Colaborador 3','Colaborador 3',0,1,'Colaborador 3'),('824','d9r2e3',6,'Colaborador 4','Colaborador 4',0,1,'Colaborador 4'),('122581','tpdb7d',7,'Carlos Jorge Barros Monteiro','Carlos Jorge Barros Monteiro',1,4,'Carlos Jorge Barros Monteiro'),('825','qdr27z',7,'Colaborador 1','Colaborador 1',0,4,'Colaborador 1'),('826','w5r257',7,'Colaborador 2','Colaborador 2',0,4,'Colaborador 2'),('827','pur2fk',7,'Colaborador 3','Colaborador 3',0,4,'Colaborador 3'),('828','f5r2kb',7,'Colaborador 4','Colaborador 4',0,4,'Colaborador 4'),('120810','pudb7k',8,'Simone Ferreira Domingues','Simone Ferreira Domingues',1,3,'Simone Ferreira Domingues'),('829','d9r2d3',8,'Colaborador 1','Colaborador 1',0,3,'Colaborador 1'),('830','qdr2gz',8,'Colaborador 2','Colaborador 2',0,3,'Colaborador 2'),('831','w5r277',8,'Colaborador 3','Colaborador 3',0,3,'Colaborador 3'),('832','pur3ck',8,'Colaborador 4','Colaborador 4',0,3,'Colaborador 4'),('123033','zvdbdr',9,'Fernando Dalbão Carvalho','Fernando Dalbão Carvalho',1,4,'Fernando Dalbão Carvalho'),('833','f5r37b',9,'Colaborador 1','Colaborador 1',0,4,'Colaborador 1'),('834','d9r353',9,'Colaborador 2','Colaborador 2',0,4,'Colaborador 2'),('835','qdr3fz',9,'Colaborador 3','Colaborador 3',0,4,'Colaborador 3'),('836','w5r3d7',9,'Colaborador 4','Colaborador 4',0,4,'Colaborador 4'),('123453','zvdbcr',10,'Celso Luiz de Araújo Cintra','Celso Luiz de Araújo Cintra',1,1,'Celso Luiz de Araújo Cintra'),('837','pur3ek',10,'Colaborador 1','Colaborador 1',0,1,'Colaborador 1'),('838','f5r3gb',10,'Colaborador 2','Colaborador 2',0,1,'Colaborador 2'),('839','d9r373',10,'Colaborador 3','Colaborador 3',0,1,'Colaborador 3'),('840','qdr3cz',10,'Colaborador 4','Colaborador 4',0,1,'Colaborador 4'),('123197','hxdbka',11,'Robmilson Simões Gundim','Robmilson Simões Gundim',1,2,'Robmilson Simões Gundim'),('841','w5r3k7',11,'Colaborador 1','Colaborador 1',0,2,'Colaborador 1'),('842','pur3dk',11,'Colaborador 2','Colaborador 2',0,2,'Colaborador 2'),('843','f5r5fb',11,'Colaborador 3','Colaborador 3',0,2,'Colaborador 3'),('844','d9r5d3',11,'Colaborador 4','Colaborador 4',0,2,'Colaborador 4'),('123105','b5dbd2',12,'Tânia Cristina Phiton-Curi','Tânia Cristina Phiton-Curi',1,3,'Tânia Cristina Phiton-Curi'),('845','qdr5ez',12,'Colaborador 1','Colaborador 1',0,3,'Colaborador 1'),('846','w5r577',12,'Colaborador 2','Colaborador 2',0,3,'Colaborador 2'),('847','pur55k',12,'Colaborador 3','Colaborador 3',0,3,'Colaborador 3'),('848','f5r5cb',12,'Colaborador 4','Colaborador 4',0,3,'Colaborador 4'),('121651','ismfrg',13,'Ismar Frango Silveira','Ismar Frango Silveira',1,2,'Ismar Frango Silveira'),('849','d9r5k3',13,'Colaborador 1','Colaborador 1',0,2,'Colaborador 1'),('850','qdr5dz',13,'Colaborador 2','Colaborador 2',0,2,'Colaborador 2'),('851','w5r5g7',13,'Colaborador 3','Colaborador 3',0,2,'Colaborador 3'),('852','pur57k',13,'Colaborador 4','Colaborador 4',0,2,'Colaborador 4'),('121672','w3onod',15,'Jorge Alexandre Onoda Pessanha','Jorge Alexandre Onoda Pessanha',1,2,'Jorge Alexandre Onoda Pessanha'),('853','f5tveb',15,'Colaborador 1','Colaborador 1',0,2,'Colaborador 1'),('854','d9tv73',15,'Colaborador 2','Colaborador 2',0,2,'Colaborador 2'),('855','qdtv5z',15,'Colaborador 3','Colaborador 3',0,2,'Colaborador 3'),('856','w5tvf7',15,'Colaborador 4','Colaborador 4',0,2,'Colaborador 4'),('122367','hxdbfa',16,'Miguel León González','Miguel León González',1,2,'Miguel León González'),('857','putvdk',16,'Colaborador 1','Colaborador 1',0,2,'Colaborador 1'),('858','f5tvdb',16,'Colaborador 2','Colaborador 2',0,2,'Colaborador 2'),('859','d9tvg3',16,'Colaborador 3','Colaborador 3',0,2,'Colaborador 3'),('860','qdtv7z',16,'Colaborador 4','Colaborador 4',0,2,'Colaborador 4'),('122753','zvdbcr',17,'Eliane Ganev','Eliane Ganev',1,1,'Eliane Ganev'),('861','w5tvc7',17,'Colaborador 1','Colaborador 1',0,1,'Colaborador 1'),('862','putvkk',17,'Colaborador 2','Colaborador 2',0,1,'Colaborador 2'),('863','f5tv5b',17,'Colaborador 3','Colaborador 3',0,1,'Colaborador 3'),('864','d9twf3',17,'Colaborador 4','Colaborador 4',0,1,'Colaborador 4'),('121671','tpdbgd',18,'Alexandre Aparecido Neves','Alexandre Aparecido Neves',1,2,'Alexandre Aparecido Neves'),('865','qdtwdz',18,'Colaborador 1','Colaborador 1',0,2,'Colaborador 1'),('866','w5twe7',18,'Colaborador 2','Colaborador 2',0,2,'Colaborador 2'),('867','putw7k',18,'Colaborador 3','Colaborador 3',0,2,'Colaborador 3'),('868','f5tw7b',18,'Colaborador 4','Colaborador 4',0,2,'Colaborador 4'),('122498','f5dbkb',19,'Roseli Gabriel','Roseli Gabriel',1,4,'Roseli Gabriel'),('869','d9twc3',19,'Colaborador 1','Colaborador 1',0,4,'Colaborador 1'),('870','qdtwkz',19,'Colaborador 2','Colaborador 2',0,4,'Colaborador 2'),('871','w5twd7',19,'Colaborador 3','Colaborador 3',0,4,'Colaborador 3'),('872','putwgk',19,'Colaborador 4','Colaborador 4',0,4,'Colaborador 4'),('123331','tpdbdd',20,'José Marcelo Tonini Ximenez','José Marcelo Tonini Ximenez',1,2,'José Marcelo Tonini Ximenez'),('873','f5twdb',20,'Colaborador 1','Colaborador 1',0,2,'Colaborador 1'),('874','d9twe3',20,'Colaborador 2','Colaborador 2',0,2,'Colaborador 2'),('875','qdtx7z',20,'Colaborador 3','Colaborador 3',0,2,'Colaborador 3'),('876','w5tx57',20,'Colaborador 4','Colaborador 4',0,2,'Colaborador 4'),('122749','qjdbcu',21,'Rosiani de C. B. R. Castro','Rosiani de C. B. R. Castro',1,3,'Rosiani de C. B. R. Castro'),('877','putxfk',21,'Colaborador 1','Colaborador 1',0,3,'Colaborador 1'),('878','f5txkb',21,'Colaborador 2','Colaborador 2',0,3,'Colaborador 2'),('879','d9txd3',21,'Colaborador 3','Colaborador 3',0,3,'Colaborador 3'),('880','qdtxgz',21,'Colaborador 4','Colaborador 4',0,3,'Colaborador 4'),('121419','qjdb5u',22,'Mário Cardoso Gantus','Mário Cardoso Gantus',1,3,'Mário Cardoso Gantus'),('881','w5tx77',22,'Colaborador 1','Colaborador 1',0,3,'Colaborador 1'),('882','putxck',22,'Colaborador 2','Colaborador 2',0,3,'Colaborador 2'),('883','f5tx7b',22,'Colaborador 3','Colaborador 3',0,3,'Colaborador 3'),('884','d9tx53',22,'Colaborador 4','Colaborador 4',0,3,'Colaborador 4'),('123232','w5dbd7',23,'José Eduardo Pelizon Pelino','José Eduardo Pelizon Pelino',1,3,'José Eduardo Pelizon Pelino'),('885','qdt9fz',23,'Colaborador 1','Colaborador 1',0,3,'Colaborador 1'),('886','w5t9d7',23,'Colaborador 2','Colaborador 2',0,3,'Colaborador 2'),('887','put9ek',23,'Colaborador 3','Colaborador 3',0,3,'Colaborador 3'),('888','f5t9gb',23,'Colaborador 4','Colaborador 4',0,3,'Colaborador 4'),('121463','zvdbfr',24,'Andrea Borelli','Andrea Borelli',1,1,'Andrea Borelli'),('889','d9t973',24,'Colaborador 1','Colaborador 1',0,1,'Colaborador 1'),('890','qdt9cz',24,'Colaborador 2','Colaborador 2',0,1,'Colaborador 2'),('891','w5t9k7',24,'Colaborador 3','Colaborador 3',0,1,'Colaborador 3'),('892','put9dk',24,'Colaborador 4','Colaborador 4',0,1,'Colaborador 4'),('122756','d9dbc3',25,'Adriana Aparecida Furlan','Adriana Aparecida Furlan',1,1,'Adriana Aparecida Furlan'),('893','f5t9fb',25,'Colaborador 1','Colaborador 1',0,1,'Colaborador 1'),('894','d9t9d3',25,'Colaborador 2','Colaborador 2',0,1,'Colaborador 2'),('895','qdt9ez',25,'Colaborador 3','Colaborador 3',0,1,'Colaborador 3'),('896','w5ta77',25,'Colaborador 4','Colaborador 4',0,1,'Colaborador 4'),('123037','hxdbda',26,'Edda Curi','Edda Curi',1,2,'Edda Curi'),('897','puta5k',26,'Colaborador 1','Colaborador 1',0,2,'Colaborador 1'),('898','f5tacb',26,'Colaborador 2','Colaborador 2',0,2,'Colaborador 2'),('899','d9tak3',26,'Colaborador 3','Colaborador 3',0,2,'Colaborador 3'),('900','qdtadz',26,'Colaborador 4','Colaborador 4',0,2,'Colaborador 4'),('122584','qddb7z',27,'José Ferreira de Souza','José Ferreira de Souza',1,4,'José Ferreira de Souza'),('901','w5tag7',27,'Colaborador 1','Colaborador 1',0,4,'Colaborador 1'),('902','puta7k',27,'Colaborador 2','Colaborador 2',0,4,'Colaborador 2'),('903','f5taeb',27,'Colaborador 3','Colaborador 3',0,4,'Colaborador 3'),('904','d9ta73',27,'Colaborador 4','Colaborador 4',0,4,'Colaborador 4'),('120740','pudbek',28,'Rita de Cássia Frenedozo','Rita de Cássia Frenedozo',1,3,'Rita de Cássia Frenedozo'),('905','qdta5z',28,'Colaborador 1','Colaborador 1',0,3,'Colaborador 1'),('906','w5taf7',28,'Colaborador 2','Colaborador 2',0,3,'Colaborador 2'),('907','putbdk',28,'Colaborador 3','Colaborador 3',0,3,'Colaborador 3'),('908','f5tbdb',28,'Colaborador 4','Colaborador 4',0,3,'Colaborador 4'),('122974','qddbgz',29,'Eduardo Fernandes Bondan','Eduardo Fernandes Bondan',1,3,'Eduardo Fernandes Bondan'),('909','d9tbg3',29,'Colaborador 1','Colaborador 1',0,3,'Colaborador 1'),('910','qdtb7z',29,'Colaborador 2','Colaborador 2',0,3,'Colaborador 2'),('911','w5tbc7',29,'Colaborador 3','Colaborador 3',0,3,'Colaborador 3'),('912','putbkk',29,'Colaborador 4','Colaborador 4',0,3,'Colaborador 4'),('122854','qddbcz',30,'Karin Louise Lens Dunker','Karin Louise Lens Dunker',1,3,'Karin Louise Lens Dunker'),('913','f5tb5b',30,'Colaborador 1','Colaborador 1',0,3,'Colaborador 1'),('914','d9tbf3',30,'Colaborador 2','Colaborador 2',0,3,'Colaborador 2'),('915','qdtbdz',30,'Colaborador 3','Colaborador 3',0,3,'Colaborador 3'),('916','w5tbe7',30,'Colaborador 4','Colaborador 4',0,3,'Colaborador 4'),('123072','w5dbg7',31,'Patrícia Moriel','Patrícia Moriel',1,3,'Patrícia Moriel'),('917','putc7k',31,'Colaborador 1','Colaborador 1',0,3,'Colaborador 1'),('918','f5tc7b',31,'Colaborador 2','Colaborador 2',0,3,'Colaborador 2'),('919','d9tcc3',31,'Colaborador 3','Colaborador 3',0,3,'Colaborador 3'),('920','qdtckz',31,'Colaborador 4','Colaborador 4',0,3,'Colaborador 4'),('120878','f5dbgb',32,'Rubens César L. Figueira','Rubens César L. Figueira',1,2,'Rubens César L. Figueira'),('921','w5tcd7',32,'Colaborador 1','Colaborador 1',0,2,'Colaborador 1'),('922','putcgk',32,'Colaborador 2','Colaborador 2',0,2,'Colaborador 2'),('923','f5tcdb',32,'Colaborador 3','Colaborador 3',0,2,'Colaborador 3'),('924','d9tce3',32,'Colaborador 4','Colaborador 4',0,2,'Colaborador 4'),('120686','naito',33,'Luis Naito Mendes Bezerra','Luis Naito Mendes Bezerra',1,2,'Luis Naito Mendes Bezerra'),('925','qdtc7z',33,'Colaborador 1','Colaborador 1',0,2,'Colaborador 1'),('926','w5tc57',33,'Colaborador 2','Colaborador 2',0,2,'Colaborador 2'),('927','putcfk',33,'Colaborador 3','Colaborador 3',0,2,'Colaborador 3'),('928','f5t2kb',33,'Colaborador 4','Colaborador 4',0,2,'Colaborador 4'),('123341','tpdbed',34,'Maria Georgina G. S. Markunas','Maria Georgina G. S. Markunas',1,4,'Maria Georgina G. S. Markunas'),('929','d9t2d3',34,'Colaborador 1','Colaborador 1',0,4,'Colaborador 1'),('930','qdt2gz',34,'Colaborador 2','Colaborador 2',0,4,'Colaborador 2'),('931','w5t277',34,'Colaborador 3','Colaborador 3',0,4,'Colaborador 3'),('932','put2ck',34,'Colaborador 4','Colaborador 4',0,4,'Colaborador 4'),('123316','d9db73',35,'Carlos Alberto Oristânio','Carlos Alberto Oristânio',1,4,'Carlos Alberto Oristânio'),('933','f5t27b',35,'Colaborador 1','Colaborador 1',0,4,'Colaborador 1'),('934','d9t253',35,'Colaborador 2','Colaborador 2',0,4,'Colaborador 2'),('935','qdt2fz',35,'Colaborador 3','Colaborador 3',0,4,'Colaborador 3'),('936','w5t2d7',35,'Colaborador 4','Colaborador 4',0,4,'Colaborador 4'),('edu','edu',35,'11','11',1,4,'11'),('123','123',35,'11','11',1,4,'11');

UNLOCK TABLES;

/*Table structure for table `cursosareas` */

DROP TABLE IF EXISTS `cursosareas`;

CREATE TABLE `cursosareas` (
  `codCurso` int(8) NOT NULL default '0',
  `codArea` int(8) default NULL,
  `descCurso` varchar(255) default NULL,
  `abrevCurso` varchar(255) default NULL,
  `codProf` int(11) default NULL,
  `codCent` int(3) default NULL,
  `nomeCoord` varchar(255) default NULL,
  PRIMARY KEY  (`codCurso`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `cursosareas` */

LOCK TABLES `cursosareas` WRITE;

insert  into `cursosareas`(`codCurso`,`codArea`,`descCurso`,`abrevCurso`,`codProf`,`codCent`,`nomeCoord`) values (1,1,'LETRAS - PORTUGUÊS/INGLÊS','LET-ING',121347,1,'Magali Elisabete Sparano'),(2,1,'LETRAS - PORTUGUÊS/ESPANHOL','LET-ESP',121347,1,'Magali Elisabete Sparano'),(3,2,'PEDAGOGIA','PED',120873,1,'Rômulo Pereira Nascimento'),(5,2,'PEDAGOGIA - DOC. P/ OS ANOS INICIAIS DO ENS. FUND 45','PED-45',120873,1,'Rômulo Pereira Nascimento'),(6,2,'PEDAGOGIA - DOC. P/ OS ANOS INICIAIS DO ENS. FUND 46','PED-46',120873,1,'Rômulo Pereira Nascimento'),(7,3,'CIÊNCIAS CONTÁBEIS','CC',123544,4,'Janete Fátima Mendonça'),(8,4,'ADMINISTRAÇÃO','ADM',120502,4,'José Carlos de Souza Lima'),(9,4,'ADMINISTRAÇÃO GERAL E DE EMPRESAS','ADM-EMP',120502,4,'José Carlos de Souza Lima'),(10,4,'ADMINISTRAÇÃO GERAL E COMÉRCIO EXTERIOR','ADM-CEXT',120502,4,'José Carlos de Souza Lima'),(11,4,'ADMINISTRAÇÃO DE MARKETING','ADM-MKT',120502,4,'José Carlos de Souza Lima'),(12,5,'EDUCAÇÃO ARTÍSTICA','EA',120729,1,'Claudemir Nunes Ferreira'),(13,5,'EDUCAÇÃO ARTÍSTICA - ARTES PLÁSTICAS','EA-ARTPL',120729,1,'Claudemir Nunes Ferreira'),(14,6,'DIREITO','DIR',122869,1,'Adriano de Assis Ferreira'),(15,7,'COMUNICAÇÃO SOCIAL','CS',122581,4,'Carlos Jorge Barros Monteiro'),(16,7,'COMUNICAÇÃO SOCIAL - PUBLICIDADE E PROPAGANDA','CS-PUBPROG',122581,4,'Carlos Jorge Barros Monteiro'),(17,7,'COMUNICAÇÃO SOCIAL - RELAÇÕES PÚBLICAS','CS-RPUB',122581,4,'Carlos Jorge Barros Monteiro'),(18,7,'COMUNICAÇÃO SOCIAL - RADIALISMO','CS-RAD',122581,4,'Carlos Jorge Barros Monteiro'),(19,7,'COMUNICAÇÃO SOCIAL - JORNALISMO','CS-JOR',122581,4,'Carlos Jorge Barros Monteiro'),(20,8,'PSICOLOGIA','PSI',120810,3,'Simone Ferreira Domingues'),(21,9,'ECONOMIA','ECO',123033,4,'Fernando Dalbão Carvalho'),(22,10,'MÚSICA - INSTRUMENTO','MUS-INS',123453,1,'Celso Luiz de Araújo Cintra'),(23,10,'MÚSICA - CANTO','MUS-CAN',123453,1,'Celso Luiz de Araújo Cintra'),(24,11,'ENGENHARIA ELÉTRICA','EE',123197,2,'Robmilson Simões Gundim'),(25,12,'EDUCAÇÃO FÍSICA','EF',123105,3,'Tânia Cristina Phiton-Curi'),(26,13,'CIÊNCIA DA COMPUTAÇÃO','CCP',121651,2,'Ismar Frango Silveira'),(28,2,'PEDAGOGIA - DOC. P/ OS ANOS INICIAIS DO ENS. FUND 54','PED/L-54',120873,1,'Rômulo Pereira Nascimento'),(29,15,'ENG. MECÂNICA - ÊNFASE EM CONTROLE E AUT','EM',121672,2,'Jorge Alexandre Onoda Pessanha'),(30,16,'ENGENHARIA CIVIL','EC',122367,2,'Miguel León González'),(31,17,'SERVIÇO SOCIAL','SS',122753,1,'Eliane Ganev'),(32,18,'ENGENHARIA DE PRODUÇÃO','EP',121671,2,'Alexandre Aparecido Neves'),(33,19,'TURISMO','TUR',122498,4,'Roseli Gabriel'),(34,20,'ARQUITETURA E URBANISMO','ARQ',123331,2,'José Marcelo Tonini Ximenez'),(35,21,'ENFERMAGEM','ENF',122749,3,'Rosiani de C. B. R. Castro'),(36,22,'FISIOTERAPIA','FISIO',121419,3,'Mário Cardoso Gantus'),(37,23,'ODONTOLOGIA','OD',123232,3,'José Eduardo Pelizon Pelino'),(38,24,'HISTÓRIA','HIST',121463,1,'Andrea Borelli'),(39,25,'GEOGRAFIA','GEO',122756,1,'Adriana Aparecida Furlan'),(41,28,'CIÊNCIAS BIOLÓGICAS','BIO',120740,3,'Rita de Cássia Frenedozo'),(42,29,'MEDICINA VETERINÁRIA','VET',122974,3,'Eduardo Fernandes Bondan'),(43,30,'NUTRIÇÃO','NUT',122854,3,'Karin Louise Lens Dunker'),(44,26,'MATEMÁTICA','MAT',123037,2,'Edda Curi'),(46,27,'GESTÃO DE RECURSOS HUMANOS','GRH',122584,4,'José Ferreira de Souza'),(47,31,'FARMÁCIA','FB',123072,3,'Patrícia Moriel'),(48,32,'QUÍMICA','QUIM',120878,2,'Rubens César L. Figueira'),(49,27,'GESTÃO FINANCEIRA','G.FIN',122584,4,'José Ferreira de Souza'),(50,33,'REDES DE COMPUTADORES','TRC',120686,2,'Luis Naito Mendes Bezerra'),(60,34,'GASTRONOMIA','GAST',123341,4,'Maria Georgina G. S. Markunas'),(65,18,'AUTOMAÇÃO INDUSTRIAL','AI',121671,2,'Alexandre Aparecido Neves'),(67,20,'DESIGN','DESIG',123331,2,'José Marcelo Tonini Ximenez'),(68,33,'ANÁLISE E DESENVOL DE SISTEMAS','ADS',120686,2,'Luis Naito Mendes Bezerra'),(71,33,'JOGOS DIGITAIS','JOGOS',120686,2,'Luis Naito Mendes Bezerra'),(72,27,'MARKETING','MKT',122584,4,'José Ferreira de Souza'),(73,33,'SISTEMAS PARA INTERNET','SI',120686,2,'Luis Naito Mendes Bezerra'),(75,35,'VISAGISMO E ESTÉTICA CAPILAR','VISAG',123316,4,'Carlos Alberto Oristânio'),(76,12,'EDUCAÇÃO FÍSICA - BACHARELADO','E FIS',123105,3,'Tânia Cristina Phiton-Curi'),(77,28,'CIÊNCIAS BIOLÓGICAS - BACHAREL','C BIO',120740,3,'Rita de Cássia Frenedozo'),(78,25,'GEOGRAFIA - BACHARELADO','GEO-BACH',122756,1,'Adriana Aparecida Furlan');

UNLOCK TABLES;

/*Table structure for table `fragilidades` */

DROP TABLE IF EXISTS `fragilidades`;

CREATE TABLE `fragilidades` (
  `login` varchar(10) NOT NULL default '',
  `senha` varchar(15) NOT NULL default '',
  `codCurso` int(4) NOT NULL default '0',
  `codCategoria` varchar(4) NOT NULL default '',
  `codfragilidade` int(4) NOT NULL default '0',
  `textoFragilidade` longblob,
  `proposta` longblob,
  `prazo` int(1) default NULL,
  PRIMARY KEY  (`login`,`senha`,`codCurso`,`codCategoria`,`codfragilidade`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `fragilidades` */

LOCK TABLES `fragilidades` WRITE;

UNLOCK TABLES;

/*Table structure for table `msgs` */

DROP TABLE IF EXISTS `msgs`;

CREATE TABLE `msgs` (
  `src` int(11) unsigned default NULL,
  `dst` int(11) unsigned default NULL,
  `textom` longblob,
  `datasend` varchar(255) default NULL,
  `lida` int(3) unsigned default NULL,
  `assunto` varchar(255) default NULL,
  `areaRem` varchar(255) default NULL,
  `adata` varchar(70) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `msgs` */

LOCK TABLES `msgs` WRITE;

insert  into `msgs`(`src`,`dst`,`textom`,`datasend`,`lida`,`assunto`,`areaRem`,`adata`) values (1113,1113,'fasdf','12/05/2008, 16:34',0,'adfadf','Gerenciador do sistema','2008/05/12, 16:34'),(1112,321,'teste','05/06/2008, 17:12',0,'edu','areaRem','2008/06/05, 17:12'),(NULL,NULL,'null','09/07/2008, 23:30',0,'null','null','2008/07/09, 23:30'),(120686,122367,'teste123','09/07/2008, 16:12',0,'123','null','2008/07/09, 16:12'),(120686,121419,'null156516','09/07/2008, 16:13',0,'156','null','2008/07/09, 16:13'),(1112,122869,'dfsadfsadfsa','04/07/2008, 14:39',0,'dsfadfsfd','Administrador do sistema','2008/07/04, 14:39'),(NULL,120686,'teste','05/07/2008, 01:01',0,'teste','areaRem','2008/07/05, 01:01'),(NULL,120686,'teste','05/07/2008, 01:11',0,'teste','areaRem','2008/07/05, 01:11'),(NULL,120686,'tete','05/07/2008, 01:23',0,'teste','areaRem','2008/07/05, 01:23'),(1112,120686,'teste123','05/07/2008, 01:32',0,'Sem assunto','Administrador do sistema','2008/07/05, 01:32'),(1112,1112,'5353757373','09/07/2008, 19:08',1,'545353537','Administrador do sistema','2008/07/09, 19:08'),(1112,813,'null1233','09/07/2008, 16:22',0,'123','null','2008/07/09, 16:22'),(1112,122584,'321','05/07/2008, 04:11',0,'213','','2008/07/05, 04:11'),(1112,120686,'12345676rft5','05/07/2008, 14:09',0,'ttttt','','2008/07/05, 14:09'),(1112,121347,'12345678','05/07/2008, 14:13',0,'ttttt','','2008/07/05, 14:13'),(120686,813,'12345676rft5','09/07/2008, 16:16',0,'ttttt','null','2008/07/09, 16:16'),(825,1112,'753','09/07/2008, 17:20',1,'753','Colaborador 1','2008/07/09, 17:20'),(120686,1112,'null5353757373','09/07/2008, 17:21',1,'545353537','Luis Naito Mendes Bezerra','2008/07/09, 17:21');

UNLOCK TABLES;

/*Table structure for table `potencialidades` */

DROP TABLE IF EXISTS `potencialidades`;

CREATE TABLE `potencialidades` (
  `login` varchar(10) NOT NULL default '',
  `senha` varchar(15) NOT NULL default '',
  `codCurso` int(4) NOT NULL default '0',
  `codCategoria` varchar(4) NOT NULL default '',
  `codPotencialidade` int(4) NOT NULL default '0',
  `textoProposta` longblob,
  `tipoPot` varchar(15) default NULL,
  PRIMARY KEY  (`login`,`senha`,`codCurso`,`codCategoria`,`codPotencialidade`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `potencialidades` */

LOCK TABLES `potencialidades` WRITE;

UNLOCK TABLES;

/*Table structure for table `subcategoria` */

DROP TABLE IF EXISTS `subcategoria`;

CREATE TABLE `subcategoria` (
  `codSubCategoria` varchar(11) NOT NULL default '',
  `codCategoria` varchar(11) NOT NULL default '',
  `descricao` varchar(255) default NULL,
  PRIMARY KEY  (`codSubCategoria`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `subcategoria` */

LOCK TABLES `subcategoria` WRITE;

insert  into `subcategoria`(`codSubCategoria`,`codCategoria`,`descricao`) values ('1.1','1','Missão e Responsabilidade Institucional'),('1.2','1','Projeto Pedagógico do Curso'),('1.3','1','ENADE (Exame Nacional de Desempenho dos Estudantes)'),('2.1','2','Gestão Institucional - Direção de Centro.'),('2.2','2','Gestão Institucional - Coordenação de Curso.'),('3.1','3','Infra-estrutura Institucional / Acadêmica'),('4.1','4','Condições para o Ensino'),('5.1','5','Currículos e Conteúdo'),('5.2','5','Metodologia de ensino'),('5.3','5','Interdisciplinaridade'),('5.4','5','Processo de avaliação'),('5.5','5','Conduta profissional / ética'),('6.1','6','Regime de trabalho / Questões institucionais'),('7.1','7','Conselhos Superiores'),('7.2','7','Representatividade'),('8.1','8','Corpo Discente (em relação ao desempenho de seus alunos)'),('9.1','9','Avaliação Institucional');

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
