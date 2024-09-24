-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               11.2.0-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for idea4rc_dm
DROP DATABASE IF EXISTS `idea4rc_dm`;
CREATE DATABASE IF NOT EXISTS `idea4rc_dm` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `idea4rc_dm`;

-- Dumping structure for table idea4rc_dm.adverse_event
DROP TABLE IF EXISTS `adverse_event`;
CREATE TABLE IF NOT EXISTS `adverse_event` (
  `id` bigint(20) NOT NULL,
  `adverse_event_duration` enum('LESS_THAN_A_WK','LESS_THAN_ONE_WK','LESS_THAN_A_MONTH','ONE_WK_TO_LESS_THAN_TWO_MONTH','THREE_MONTHS_TO_SIX_MONTH','SIX_MONTHS_TO_TWELVE_MONTHS') DEFAULT NULL,
  `adverse_event_starting_date` datetime(6) DEFAULT NULL,
  `adverse_event_type` enum('ADVERSE_EVENT_GRADE_1','ADVERSE_EVENT_GRADE_2','ADVERSE_EVENT_GRADE_3','ADVERSE_EVENT_GRADE_4','ADVERSE_EVENT_GRADE_5') DEFAULT NULL,
  `episode_event` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4pefg41hl86nu1pi62xiq904w` (`episode_event`),
  CONSTRAINT `FK4pefg41hl86nu1pi62xiq904w` FOREIGN KEY (`episode_event`) REFERENCES `episode_event` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table idea4rc_dm.cancer_episode
DROP TABLE IF EXISTS `cancer_episode`;
CREATE TABLE IF NOT EXISTS `cancer_episode` (
  `id` bigint(20) NOT NULL,
  `age_at_diagnosis` int(11) DEFAULT NULL,
  `biopsy_done_by` varchar(255) DEFAULT NULL,
  `biopsy_mitotic_count` float DEFAULT NULL,
  `breast_subsite` enum('BREAST_STRUCTURE') DEFAULT NULL,
  `chondro_osseous_tumours` enum('EXTRASKELETAL_OSTEOSARCOMA') DEFAULT NULL,
  `crpcreactive_protein_tested` enum('POSITIVE','NEGATIVE','NOT_TESTED') DEFAULT NULL,
  `date_of_diagnosis` datetime(6) DEFAULT NULL,
  `depth` enum('INVASION_INTO_FASCIA','NO_INVASION') DEFAULT NULL,
  `est_and_related_tumours` enum('EST_SARCOMA_HIGH_GRADE','EST_SARCOMA_LOW_GRADE') DEFAULT NULL,
  `genito_urinary_subsite` enum('BILATERAL_ADRENAL_GLANDS','KIDNEY_STRUCTURE','REGION_OF_URETER','URINARY_BLADDER_STRUCTURE','STRUCTURE_OF_LOBE_OF_PROSTATE','SEMINAL_VESCICLE_STRUCTURE','SPERMATIC_CORD_STRUCTURE','TESTIS_STRUCTURE','PENILE_STRUCTURE','UTERINE_STRUCTURE','OVARIAN_STRUCTURE','FALLOPIAN_TUBE_STRUCTURE','VAGINAL_STRUCTURE','VULVAL_STRUCTURE') DEFAULT NULL,
  `grading` enum('GRADE_1','GRADE_2','GRADE_3','GRADE_H','GRADE_L') DEFAULT NULL,
  `head_and_neck_subsite` enum('FACE_NECK_STRUCTURE') DEFAULT NULL,
  `histology_adenocarcinoma` enum('SALIVARY_GLAND','CYSTOADENOCARCINOMA','MUCINOUS','CERUMINOUS','NASOPHARYNX_PAPILLARY_ADENOCARCINOMA','ADENOID_CYSTIC_CARCINOMA','MUCOEPIDERMOID_CARCINOMA','POLYMORPHOUS','LOBULAR_CARCINOMA','ACINAR_CELL_CARCINOMA','CLEAR_CELL_CARCINOMA','BASAL_CELL_ADENOCARCINOMA','SALIVARY_DUCT_CARCINOMA','MAMMARY_SECRETORY_CARCINOMA','MYOEPITHELIAL_CARCINOMA','EX_PLEOMORPHIC_ADENOCARCINOMA','SEBACEOUS_ADENOCARCINOMA','SEBACEOUS_LYMPHADENOCARCINOMA','CARCINOSARCOMA','OXYPHILIC_CARCINOMA') DEFAULT NULL,
  `histology_neuroendocrine` enum('SMCC','POORLY_DIFFERENTIATED_NEUROENDOCRINE_CARCINOMA','LARGE_CELL_NEUROENDOCRINE_CARCINOMA') DEFAULT NULL,
  `histology_odontogenic_carcinoma` enum('ODONTOGENIC_CARCINOMA','AMELOBLASTIC_CARCINOMA','DEDIFFERENTIATED_INTRAOSSEOUS_AMELOBLASTIC_CARCINOMA','DEDIFFERENTIATED_PERIPHERAL_AMELOBLASTIC_CARCINOMA','PRIMARY_INTRAOSSEOUS_CARCINOMA','INTRAOSSEOUS_CARCINOMA_DEVELOPED_ON_ODONTOGENIC_CYST','CLEAR_CELL_ODONTOGENIC_CARCINOMA','GHOST_CELL_ODONTOGENIC_CARCINOMA') DEFAULT NULL,
  `histology_snuc` enum('SNUC') DEFAULT NULL,
  `histology_squamous` enum('KERATINIZING_SQUAMOUS_CELL_CARCINOMA','NON_KERATINIZING_SQUAMOUS_CELL_CARCINOMA','SCHNEIDERIAN_CARCINOMA','SPINDLE_CELLSQUAMOUS_CELL_CARCINOMA','LYMPHOEPITHELIAL_CARCINOMA','BASALOID_SQUAMOUS_CELL_CARCONOMA','VERRUCOUS_SQUAMOUS_CAELL_CARCINOMA','PAPILLARY_SQUAMOUS_CELL_CARCINOMA','SQUAMOUS_CELL_CARCINOMA','SQUAMOUS_CELL_CARCINOMA_HPV_POSITIVE','SQUAMOUS_CELL_CARCINOMA_HPV_NEGATIVE') DEFAULT NULL,
  `histology_subgroup_adipocytic_tumours` enum('LIPOSARCOMA_WELL_DIFF','DEDIFFERENTIATED_LIPOSARCOMA','MYXOID_LIPOSARCOMA','PLEOMORPHIC_LIPOSARCOMA') DEFAULT NULL,
  `histology_subgroup_fmt_tumours` enum('PALMAR_PLANTAR_FMT','AGGRESSIVE_FIBROMATOSIS','LIPOFIBROMATOSIS','GIANT_CELL_FIBROBLASTOMA','DERMATOFIBROSARCOMA_PROTUBERANS','SOLITARY_FIBROUS_TUMOR','SOLITARY_FMT_MALIGNANT','MYOFIBROBLASTIC_TUMOUR','LOW_GRADE_MYOFIBROBLASTIC_SARCOMA','CELLULAR_FIBROMA','MYXOINFLAMMATORY_FIBROBLASTIC_SARCOMA','INFANTILE_FIBROSARCOMA','FIBROSARCOMA','MYXOFIBROSARCOMA','LOW_GRADE_FIBROMYXOID_SARCOMA','SCLEROSING_EPITHELIOID_FIBROSARCOMA') DEFAULT NULL,
  `histology_subgroupsocalled_fibrohistiocytic_tumours` enum('PLEXIFORM_FIBROHISTIOCYTIC_TUMOR','GIANT_CELL_TUMOR_SOFT_PARTS','TENOSYNOVIAL_GIANT_CELL_TUMOR','TENOSYNOVIAL_GIANT_CELL_TUMOR_DIFFUSE','MALIGNANT_TENOSYNOVIAL_GIANT_CELL_TUMOR') DEFAULT NULL,
  `hpv_status` enum('POSITIVE','NEGATIVE','NOT_TESTED') DEFAULT NULL,
  `hypopharynx_subsite` enum('POSTCRICOID_REGION','HYPOPHARYNGEAL_ASPECT_ARYE_FOLD','POST_WALL_HYPOPHARYNX','PIRIFORM_SINUS') DEFAULT NULL,
  `intra_abdominal_subsite` enum('RETROPERITONEAL_COMP_STRUCT','INFERIOR_VENA_CAVA_STRUCTURE','ILIAC_VESSEL','STRUCTURE_OF_RENAL_ARTERY','GONADAL_ARTERY','STRUCTURE_OF_MESENTERIC_ARTERY','RENAL_PELVIS_STRUCTURE','MAJOR_PELVIS_STRUCTURE','REGION_OF_ESOPHAGUS','STOMACH','DUODENAL_STRUCTURE','JEJUNAL_STRUCTURE','STRICTURE_OF_ILEUM','COLON_STRUCTURE','RECTUM_STRUCTURE','MESENTERY') DEFAULT NULL,
  `intra_thoracic_subsite` enum('LUNG_STRUCTURE','HEART_STRUCTURE','PLEURA_STRUCTURE','REGION_OF_MEDIASTINUM','SUPERIOR_VENA_CAVA_STRUCTURE','AORTA_PART','STRICTURE_OF_PULMONARY_VESSEL','STRUCTURE_OF_SUBCLAVIAN_ARTERY') DEFAULT NULL,
  `larynx_subsite` enum('GLOTTIS','SUPRAGLOTTIS','SUBGLOTTIS','LARYNGEAL_CARTILAGE') DEFAULT NULL,
  `lip_subsite` enum('EXTERNAL_LOWER_LIP','EXTERNAL_UPPER_LIP','EXTERNAL_LIP','MUCOSA_UPPER_LIP','MUCOSA_LOWER_LIP','MUCOSA_LIP','COMMISURE_LIP') DEFAULT NULL,
  `miscellanious_mesenchimal_tumors` enum('UTERINE_TUMOR','BENIGN_PHYLLODES_TUMOR','BORDERLINE_PHYLLODES_TUMOR','PHYLLODES_TUMOUR_MALIGNANT','FOLLICULAR_DENDRITIC_CELL_SARCOMA','HISTIOCYTIC_SARCOMA','INTERDIGITATING_DENDRITIC_CELL_SARCOMA','LANGHERANS_CELL_SARCOMA','FIBROBLASTIC_RETICULAR_CELL_TUMOUR','BIPHENOTYPIC_SINONASAL_SARCOMA') DEFAULT NULL,
  `mixed_epithelial_and_mesenchymal_tumours` enum('ADENOSARCOMA') DEFAULT NULL,
  `nasal_cavity_and_paranasal_sinuses_subsite` enum('NASAL_CAVITY','MAXILLARY_SINUS','ETHMOID_SINUS','FRONTAL_SINUS','SPHENOID_SINUS') DEFAULT NULL,
  `nasopharynx_subsite` enum('SUP_WALL_NASOPHARYNX','POST_WALL_NASOPHARYNX','LAT_WALL_NASOPHARYNX','ANT_WALL_NASOPHARYNX') DEFAULT NULL,
  `oral_cavity_subsite` enum('BORDER_TONGUE','DORSAL_SURFACE_TONGUE','VENTRAL_SURFACE_OF_TONGUE','UPPER_GUM','LOWER_GUM','ANTERIOR_FLOOR_OF_MOUTH','LATERAL_FLOOR_OF_MOUTH','OVERLAPPING_LESION_OF_FLOOR_OF_MOUTH','HARD_PALATE','CHEEK_MUCOSA','VESTIBULE_OF_MOUTH','RETROMOLAR_AREA') DEFAULT NULL,
  `oropharynx_subsite` enum('BASE_TONGUE','SOFT_PALATE_NOS','UVULA','TONSILLAR_FOSSA','LINGUAL_TONSIL','TONSILLAR_PILLAR','VALLECULA','ANTERIOR_SURFACE_OF_EPIGLOTTIS','LATERAL_WALL_OROPHARYNX','POSTERIOR_WALL_OROPHARYNX','BRANCHIAL_CLEFT') DEFAULT NULL,
  `other_subsite` enum('ENUM') DEFAULT NULL,
  `pericytic_perivascular_tumours` enum('GLOMUS_TUMOUR') DEFAULT NULL,
  `peripheral_nerve_sheath_tumours` enum('MALIGNANT_PERI_NERVE_SHEATH_TUMOR','MELANOTIC_MALIGNANT_PERI_NERVE_SHEATH_TUMOR','GRANULAR_CELL_TUMOUR','GRANULAR_CELL_TUMOUR_MALIGNANT') DEFAULT NULL,
  `plasmatic_ebv_dna_at_baseline` enum('POSITIVE','NEGATIVE','NOT_TESTED') DEFAULT NULL,
  `radiotherapy_induced_sarcoma` enum('RADIATION_THERAPY_IND_CHANGE') DEFAULT NULL,
  `skeletal_muscle_tumours` enum('EMBRYONAL_RHABDOMYOSARCOMA','ALVEOLAR_RHABDOMYOSARCOMA','PLEOMORPHIC_RHABDOMYOSARCOMA','SPLINDLE_CELL_RHABDOMYOSARCOMA','RHABDOMYOSARCOMA_GANGLIONIC_DIFF') DEFAULT NULL,
  `smooth_muscle_tumours` enum('SMOOTH_MUSCLE_TUMOUR','EPITHELIOID_STUMP','MYXOID_STUMP','METASTASIZING_LEIOMYOMA','LEIOMYOSARCOMA','EPITHELIOID_LEIOMYOSARCOMA','MYXOID_LEIOMYOSARCOMA') DEFAULT NULL,
  `trunk_wall_subsite` enum('JOINT_STRUCT_THORACIC_WALL','ANTERIOR_ABDOMINAL_WALL_STRUCTURE','POSTERIOR_ABDOMINAL_WALL_STRUCTURE') DEFAULT NULL,
  `tumor_size` float DEFAULT NULL,
  `tumours_of_uncertain_differentiation` enum('ATYPICAL_FIBROUS_HISTIOCYTOMA','ANGIOMATOID_FIBROUS_HISTIOCYTOMA','PLEOMORPHIC_HYALINIZING_ANGIECTATIC_TUMOUR','SYNOVIAL_SARCOMA','EPITHELIOID_SARCOMA','ALVEOLAR_SOFT_PART_SARCOMA','CLEAR_CELL_SARCOMA','MYXOID_CHONDROSARCOMA','DESMOPLASTIC_SMALL_ROUND_CELL_TUMOR','MALIGNANT_RHABDOID_TUMOR','PERIVASCULAR_EPITHELIOID_TUMOR_BENIGN','PERIVASCULAR_EPITHELIOID_TUMOR_MALIGNANT','PERIVASCULAR_EPITHELIOID_CELL_TUMOR','INTIMAL_SARCOMA','UNDIFFERENTIATED_SARCOMA','MYOEPITHELIOMA','OSSIFYING_FIBROMYXOID_TUMOUR','PHOSPHATURIC_MESENCHYMAL_TUMOUR_MALIGNANT','ANGIOMYXOMA','ANGIO_FIBR_HISTIOCYT') DEFAULT NULL,
  `type_of_biopsy` enum('FINE_NEEDLE_BIOPSY','CORE_NEEDLE_BIOPSY','INCISIONAL_BIOPSY','EXCISIONAL_BIOPSY','EXCISION') DEFAULT NULL,
  `undif_smallrcel_sarc_bon_and_sof_tis` enum('EWING_SARCOMA') DEFAULT NULL,
  `upper_and_lower_limbs_subsite` enum('HAND_STRUCTURE','WRIST_REGION_STRUCTURE','FOREARM_STRUCTURE','ELBOW_REGION_STRUCTURE','ANTECUBITAL_FOSSA_SURFACE_REGION','UPPER_ARM_STRUCTURE','FOOT_STRUCTURE','ANKLE_REGION_STRUCTURE','LOWER_LEG_STRUCTURE','KNEE_REGION_STRUCTURE','POPLITEAL_FOSSA_STRUCTURE','UPPER_LEG','DELTOID','SUPRACLAVICULAR','PERISCAPULAR_REGION','TRAPEZIUS','GROIN','BUTTOCK','PECTORAL','AXILLA') DEFAULT NULL,
  `vascular_tumours` enum('EPITHELIOID_HAEMANGIOENDOTHELIOMA','ANGIOSARCOMA','HEMANGIOENDOTHELIOMA','RETIFORM_HAEMANGIOENDOTHELIOMA','PAPILLARY_INTRALYMPH_ANGIOENDOTHELIOMA','COMPOSITE_HAEMANGIOENDOTHELIOMA','PSEUDOMYOGENIC_HEMANGIOENDOTHELIOMA') DEFAULT NULL,
  `patient` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK17fn7yxaxdfux6cc2o0ap6b72` (`patient`),
  CONSTRAINT `FK17fn7yxaxdfux6cc2o0ap6b72` FOREIGN KEY (`patient`) REFERENCES `patient` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table idea4rc_dm.drugs_for_treatments
DROP TABLE IF EXISTS `drugs_for_treatments`;
CREATE TABLE IF NOT EXISTS `drugs_for_treatments` (
  `id` bigint(20) NOT NULL,
  `drug` enum('ENUM','ENUM2') DEFAULT NULL,
  `isolated_limb_perfusion` bigint(20) DEFAULT NULL,
  `other_local_treatment` bigint(20) DEFAULT NULL,
  `systemic_treatment` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKawtp63lo2nc8xx30236voovc5` (`isolated_limb_perfusion`),
  KEY `FKqcf18oc623l8ks14kyp7s6452` (`other_local_treatment`),
  KEY `FK4vnwdinpd9xnnuoj4nbouasg0` (`systemic_treatment`),
  CONSTRAINT `FK4vnwdinpd9xnnuoj4nbouasg0` FOREIGN KEY (`systemic_treatment`) REFERENCES `systemic_treatment` (`id`),
  CONSTRAINT `FKawtp63lo2nc8xx30236voovc5` FOREIGN KEY (`isolated_limb_perfusion`) REFERENCES `isolated_limb_perfusion` (`id`),
  CONSTRAINT `FKqcf18oc623l8ks14kyp7s6452` FOREIGN KEY (`other_local_treatment`) REFERENCES `other_local_treatment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table idea4rc_dm.episode_event
DROP TABLE IF EXISTS `episode_event`;
CREATE TABLE IF NOT EXISTS `episode_event` (
  `id` bigint(20) NOT NULL,
  `date_of_episode` datetime(6) DEFAULT NULL,
  `defined_at` varchar(255) DEFAULT NULL,
  `event_type` enum('FIRST_EPISODE','PROGRESSION','RECURRENCE','STABLE_DISEASE') DEFAULT NULL,
  `cancer_episode` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKtjojnc6yrxtc9w89m1ldnmd11` (`cancer_episode`),
  CONSTRAINT `FKtjojnc6yrxtc9w89m1ldnmd11` FOREIGN KEY (`cancer_episode`) REFERENCES `cancer_episode` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table idea4rc_dm.genetic_test_expression
DROP TABLE IF EXISTS `genetic_test_expression`;
CREATE TABLE IF NOT EXISTS `genetic_test_expression` (
  `id` bigint(20) NOT NULL,
  `ct_dna_performed` bit(1) DEFAULT NULL,
  `date_of_ct_dna` datetime(6) DEFAULT NULL,
  `date_of_gene_expression` datetime(6) DEFAULT NULL,
  `date_of_gene_mutation` datetime(6) DEFAULT NULL,
  `date_of_immunohistochemistry` datetime(6) DEFAULT NULL,
  `date_of_ngs` datetime(6) DEFAULT NULL,
  `date_of_pcr` datetime(6) DEFAULT NULL,
  `date_of_traslocation` datetime(6) DEFAULT NULL,
  `gene_expression_analysis_performed` bit(1) DEFAULT NULL,
  `gene_mutation_analysis_performed` bit(1) DEFAULT NULL,
  `immunohistochemistry_performed` bit(1) DEFAULT NULL,
  `ngs_performed` bit(1) DEFAULT NULL,
  `pcr_test_performed` bit(1) DEFAULT NULL,
  `tests_for_chromosome_translocations_performed` bit(1) DEFAULT NULL,
  `episode_event` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKos6l3co5irfhqoo3lnh6mw7a6` (`episode_event`),
  CONSTRAINT `FKos6l3co5irfhqoo3lnh6mw7a6` FOREIGN KEY (`episode_event`) REFERENCES `episode_event` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table idea4rc_dm.hn_stage
DROP TABLE IF EXISTS `hn_stage`;
CREATE TABLE IF NOT EXISTS `hn_stage` (
  `id` bigint(20) NOT NULL,
  `bone` bit(1) DEFAULT NULL,
  `brain` bit(1) DEFAULT NULL,
  `distant_lymph_node` bit(1) DEFAULT NULL,
  `liver` bit(1) DEFAULT NULL,
  `lung` bit(1) DEFAULT NULL,
  `other_viscera` bit(1) DEFAULT NULL,
  `peritoneum` bit(1) DEFAULT NULL,
  `pleura` bit(1) DEFAULT NULL,
  `soft_tissue` bit(1) DEFAULT NULL,
  `unknown` bit(1) DEFAULT NULL,
  `episode_event` bigint(20) DEFAULT NULL,
  `cm` enum('C_M0_AJCC_6TH','C_M0_AJCC_7TH','C_M0_AJCC_8TH','C_M1_AJCC_6TH','C_M1_AJCC_7TH','C_M1_AJCC_8TH') DEFAULT NULL,
  `cn` enum('C_NX_AJCC_6TH','C_NX_AJCC_7TH','C_NX_AJCC_8TH','C_N0_AJCC_6TH','C_N0_AJCC_7TH','C_N0_AJCC_8TH','C_N1_AJCC_6TH','C_N1_AJCC_7TH','C_N1_AJCC_8TH','C_N2_AJCC_6TH','C_N2_AJCC_7TH','C_N2_AJCC_8TH','C_N2A_AJCC_6TH','C_N2A_AJCC_7TH','C_N2A_AJCC_8TH','C_N2B_AJCC_6TH','C_N2B_AJCC_7TH','C_N2B_AJCC_8TH','C_N2C_AJCC_6TH','C_N2C_AJCC_7TH','C_N2C_AJCC_8TH','C_N3_AJCC_6TH','C_N3_AJCC_7TH','C_N3_AJCC_8TH','C_N3A_AJCC_6TH','C_N3A_AJCC_7TH','C_N3A_AJCC_8TH','C_N3B_AJCC_6TH','C_N3B_AJCC_7TH','C_N3B_AJCC_8TH') DEFAULT NULL,
  `ct` enum('C_TX_AJCC_6TH','C_TX_AJCC_7TH','C_TX_AJCC_8TH','C_TIS_AJCC_6TH','C_TIS_AJCC_7TH','C_TIS_AJCC_8TH','C_T0_AJCC_6TH','C_T0_AJCC_7TH','C_T0_AJCC_8TH','C_T1_AJCC_6TH','C_T1_AJCC_7TH','C_T1_AJCC_8TH','C_T2_AJCC_6TH','C_T2_AJCC_7TH','C_T2_AJCC_8TH','C_T3_AJCC_6TH','C_T3_AJCC_7TH','C_T3_AJCC_8TH','C_T4_AJCC_6TH','C_T4_AJCC_7TH','C_T4_AJCC_8TH','C_T4A_AJCC_6TH','C_T4A_AJCC_7TH','C_T4A_AJCC_8TH','C_T4B_AJCC_6TH','C_T4B_AJCC_7TH','C_T4B_AJCC_8TH') DEFAULT NULL,
  `pm` enum('P_M0_AJCC_6TH','P_M0_AJCC_7TH','P_M0_AJCC_8TH','P_M1_AJCC_6TH','P_M1_AJCC_7TH','P_M1_AJCC_8TH') DEFAULT NULL,
  `pn` enum('P_NX_AJCC_6TH','P_NX_AJCC_7TH','P_NX_AJCC_8TH','P_N0_AJCC_6TH','P_N0_AJCC_7TH','P_N0_AJCC_8TH','P_N1_AJCC_6TH','P_N1_AJCC_7TH','P_N1_AJCC_8TH','P_N2_AJCC_6TH','P_N2_AJCC_7TH','P_N2_AJCC_8TH','P_N2A_AJCC_6TH','P_N2A_AJCC_7TH','P_N2A_AJCC_8TH','P_N2B_AJCC_6TH','P_N2B_AJCC_7TH','P_N2B_AJCC_8TH','P_N2C_AJCC_6TH','P_N2C_AJCC_7TH','P_N2C_AJCC_8TH','P_N3_AJCC_6TH','P_N3_AJCC_7TH','P_N3_AJCC_8TH','P_N3A_AJCC_6TH','P_N3A_AJCC_7TH','P_N3A_AJCC_8TH','P_N3B_AJCC_6TH','P_N3B_AJCC_7TH','P_N3B_AJCC_8TH') DEFAULT NULL,
  `pt` enum('P_TX_AJCC_6TH','P_TX_AJCC_7TH','P_TX_AJCC_8TH','P_TIS_AJCC_6TH','P_TIS_AJCC_7TH','P_TIS_AJCC_8TH','P_T0_AJCC_6TH','P_T0_AJCC_7TH','P_T0_AJCC_8TH','P_T1_AJCC_6TH','P_T1_AJCC_7TH','P_T1_AJCC_8TH','P_T2_AJCC_6TH','P_T2_AJCC_7TH','P_T2_AJCC_8TH','P_T3_AJCC_6TH','P_T3_AJCC_7TH','P_T3_AJCC_8TH','P_T4_AJCC_6TH','P_T4_AJCC_7TH','P_T4_AJCC_8TH','P_T4A_AJCC_6TH','P_T4A_AJCC_7TH','P_T4A_AJCC_8TH','P_T4B_AJCC_6TH','P_T4B_AJCC_7TH','P_T4B_AJCC_8TH') DEFAULT NULL,
  `r_ene` enum('ENE_NEG','ENE_POS') DEFAULT NULL,
  `staging_classification` enum('C_STAGE_0_AJCC_6TH','C_STAGE_0_AJCC_7TH','C_STAGE_0_AJCC_8TH','C_STAGE_1_AJCC_6TH','C_STAGE_1_AJCC_7TH','C_STAGE_1_AJCC_8TH','C_STAGE_2_AJCC_6TH','C_STAGE_2_AJCC_7TH','C_STAGE_2_AJCC_8TH','C_STAGE_3_AJCC_6TH','C_STAGE_3_AJCC_7TH','C_STAGE_3_AJCC_8TH','C_STAGE_4_AJCC_6TH','C_STAGE_4_AJCC_7TH','C_STAGE_4_AJCC_8TH','C_STAGE_4A_AJCC_6TH','C_STAGE_4A_AJCC_7TH','C_STAGE_4A_AJCC_8TH','C_STAGE_4B_AJCC_6TH','C_STAGE_4B_AJCC_7TH','C_STAGE_4B_AJCC_8TH','C_STAGE_4C_AJCC_6TH','C_STAGE_4C_AJCC_7TH','C_STAGE_4C_AJCC_8TH','P_STAGE_0_AJCC_6TH','P_STAGE_0_AJCC_7TH','P_STAGE_0_AJCC_8TH','P_STAGE_1_AJCC_6TH','P_STAGE_1_AJCC_7TH','P_STAGE_1_AJCC_8TH','P_STAGE_2_AJCC_6TH','P_STAGE_2_AJCC_7TH','P_STAGE_2_AJCC_8TH','P_STAGE_3_AJCC_6TH','P_STAGE_3_AJCC_7TH','P_STAGE_3_AJCC_8TH','P_STAGE_4_AJCC_6TH','P_STAGE_4_AJCC_7TH','P_STAGE_4_AJCC_8TH','P_STAGE_4A_AJCC_6TH','P_STAGE_4A_AJCC_7TH','P_STAGE_4A_AJCC_8TH','P_STAGE_4B_AJCC_6TH','P_STAGE_4B_AJCC_7TH','P_STAGE_4B_AJCC_8TH','P_STAGE_4C_AJCC_6TH','P_STAGE_4C_AJCC_7TH','P_STAGE_4C_AJCC_8TH') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_1i9yqtqkayhu7guoh5ci6ahhu` (`episode_event`),
  CONSTRAINT `FK_1i9yqtqkayhu7guoh5ci6ahhu` FOREIGN KEY (`episode_event`) REFERENCES `episode_event` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table idea4rc_dm.hospital_data
DROP TABLE IF EXISTS `hospital_data`;
CREATE TABLE IF NOT EXISTS `hospital_data` (
  `id` bigint(20) NOT NULL,
  `hospital_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table idea4rc_dm.hospital_patient_records
DROP TABLE IF EXISTS `hospital_patient_records`;
CREATE TABLE IF NOT EXISTS `hospital_patient_records` (
  `id` bigint(20) NOT NULL,
  `date_of_first_contact_with_the_hospital` datetime(6) DEFAULT NULL,
  `hospital_data` bigint(20) DEFAULT NULL,
  `patient` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhs837vyn4ro9bvl0lnbextnxl` (`hospital_data`),
  KEY `FKojrgqcg22aohn3a4sxu4hcms5` (`patient`),
  CONSTRAINT `FKhs837vyn4ro9bvl0lnbextnxl` FOREIGN KEY (`hospital_data`) REFERENCES `hospital_data` (`id`),
  CONSTRAINT `FKojrgqcg22aohn3a4sxu4hcms5` FOREIGN KEY (`patient`) REFERENCES `patient` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table idea4rc_dm.isolated_limb_perfusion
DROP TABLE IF EXISTS `isolated_limb_perfusion`;
CREATE TABLE IF NOT EXISTS `isolated_limb_perfusion` (
  `id` bigint(20) NOT NULL,
  `episode_event` bigint(20) DEFAULT NULL,
  `end_date` datetime(6) DEFAULT NULL,
  `start_date` datetime(6) DEFAULT NULL,
  `treatment_response` enum('COMPLETE_REMISSION','PARTIAL_REMISSION','STABLE_DISEASE','PROGRESSION') DEFAULT NULL,
  `type_of_local_treatment` enum('HYPERTHERMIA','OTHER') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_mxtivnmyxw2b0e7osdytwtkfe` (`episode_event`),
  CONSTRAINT `FK_mxtivnmyxw2b0e7osdytwtkfe` FOREIGN KEY (`episode_event`) REFERENCES `episode_event` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table idea4rc_dm.other_local_treatment
DROP TABLE IF EXISTS `other_local_treatment`;
CREATE TABLE IF NOT EXISTS `other_local_treatment` (
  `id` bigint(20) NOT NULL,
  `episode_event` bigint(20) DEFAULT NULL,
  `end_date` datetime(6) DEFAULT NULL,
  `start_date` datetime(6) DEFAULT NULL,
  `treatment_response` enum('COMPLETE_REMISSION','PARTIAL_REMISSION','STABLE_DISEASE','PROGRESSION') DEFAULT NULL,
  `type_of_local_treatment` enum('HYPERTHERMIA','OTHER') DEFAULT NULL,
  `isolated_limb_perfusion` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_2rwews1efospmtkeu5by5qpbi` (`isolated_limb_perfusion`),
  KEY `FK_c3hrow2lmbk53msmbhruvngnw` (`episode_event`),
  CONSTRAINT `FK_c3hrow2lmbk53msmbhruvngnw` FOREIGN KEY (`episode_event`) REFERENCES `episode_event` (`id`),
  CONSTRAINT `FKb6tv7juw8o4waui0e5f9sdsto` FOREIGN KEY (`isolated_limb_perfusion`) REFERENCES `isolated_limb_perfusion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table idea4rc_dm.pathological_report_info
DROP TABLE IF EXISTS `pathological_report_info`;
CREATE TABLE IF NOT EXISTS `pathological_report_info` (
  `id` bigint(20) NOT NULL,
  `degree_of_cytologic_atypia` enum('MILD_CYT_ATYPIA','MOD_CYT_ATYPIA','SEV_CYT_ATYPIA') DEFAULT NULL,
  `expression_of_er_pr` tinyint(4) DEFAULT NULL CHECK (`expression_of_er_pr` between 0 and 3),
  `mitotic_activity` float DEFAULT NULL,
  `type_of_necrosis` tinyint(4) DEFAULT NULL CHECK (`type_of_necrosis` between 0 and 4),
  `vascular_intrusion_or_invasion` bit(1) DEFAULT NULL,
  `episode_event` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgxr7omv3gxsoxljr5ue54poba` (`episode_event`),
  CONSTRAINT `FKgxr7omv3gxsoxljr5ue54poba` FOREIGN KEY (`episode_event`) REFERENCES `episode_event` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table idea4rc_dm.patient
DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `id` bigint(20) NOT NULL,
  `aids` bit(1) DEFAULT NULL,
  `alcohol` enum('CURRENT_DRINKER','EX_DRINKER','LT_NONDRINKER_ALCOHOL','EX_PROBLEM_DRINKER') DEFAULT NULL,
  `birth_year` int(11) DEFAULT NULL,
  `bmi` float DEFAULT NULL,
  `cerebrovascular_accident_except_hemiplegia` bit(1) DEFAULT NULL,
  `charlson_comorbidity_index` int(11) DEFAULT NULL,
  `chronic_pulmonary_disease` bit(1) DEFAULT NULL,
  `cigarettes_pack_years_smoked_during_life` int(11) DEFAULT NULL,
  `comorbidity` enum('YES','NO') DEFAULT NULL,
  `congestive_heart_failure` bit(1) DEFAULT NULL,
  `connective_tissue_disease` bit(1) DEFAULT NULL,
  `country_of_residence` enum('AFRICAN_COUNTRY','ASIAN_COUNTRY','AUSTRALASIAN_COUNTRY','CARIBBEAN_COUNTRY','CENTRAL_AMERICAN_COUNTRY','EUROPEAN_COUNTRY','NORTH_AMERICAN_COUNTRY','SOUTH_AMERICAN_COUNTRY') DEFAULT NULL,
  `dementia` bit(1) DEFAULT NULL,
  `diabetes_with_end_organ_damage` bit(1) DEFAULT NULL,
  `diabetes_without_complications` bit(1) DEFAULT NULL,
  `ecog_ps` int(11) DEFAULT NULL,
  `ecog_ps_label` enum('ECOG_PS_GRADE_0','ECOG_PS_GRADE_1','ECOG_PS_GRADE_2','ECOG_PS_GRADE_3','ECOG_PS_GRADE_4','ECOG_PS_GRADE_5') DEFAULT NULL,
  `gender` enum('MALE','FEMALE') DEFAULT NULL,
  `hemiplegia` bit(1) DEFAULT NULL,
  `karnofsy_index_at_diagnosis` int(11) DEFAULT NULL,
  `karnofsy_index_label` enum('KPS_10','KPS_100','KPS_20','KPS_30','KPS_40','KPS_50','KPS_60','KPS_70','KPS_80','KPS_90','KPS_0') DEFAULT NULL,
  `leukemia` bit(1) DEFAULT NULL,
  `li_fraumeni_syndrome` bit(1) DEFAULT NULL,
  `lymphoma` bit(1) DEFAULT NULL,
  `maffuci_syndrome` bit(1) DEFAULT NULL,
  `mc_cune_albright_syndrome` bit(1) DEFAULT NULL,
  `metastatic_solid_tumor` bit(1) DEFAULT NULL,
  `mild_liver_disease` bit(1) DEFAULT NULL,
  `moderate_to_severe_liver_disease` bit(1) DEFAULT NULL,
  `moderate_to_severe_renal_disease` bit(1) DEFAULT NULL,
  `multiple_myeloma` bit(1) DEFAULT NULL,
  `multiple_osteochondromas` bit(1) DEFAULT NULL,
  `myocardial_infarction` bit(1) DEFAULT NULL,
  `neurofibromatosis_type1` bit(1) DEFAULT NULL,
  `no_genetic_syndrome_who2020` bit(1) DEFAULT NULL,
  `occurrence_of_other_cancer` enum('NEOPLASM_AND_OR_HAMARTOMA','ANGIOMATOSIS','CHORIOANGIOMA','HAMARTOMA','HEMANGIOMA','LYMPHANGIOMA','NEOPLASTIC_DISEASE','NEONATAL_ALVEOLAR_LYMPHANGIOMA','ACQUIRED_LYMPHANGIOMA','CONGENITAL_LYMPHANGIOMA','LYMPHANGIOMA_OF_ORBIT','LYMPHANGIOMA_OF_SKIN','CYSTIC_HYGROMA_IN_FETUS','LYMPHANGIOMA_OF_LARYNX','RHABDOMYOMATOUS_NEOPLASM','NEOPLASM_OF_DIGESTIVE_SYSTEM','MALIGNANT_NEOPLASTIC_DISEASE','CARCINOMA_IN_SITU','NEOPLASTIC_DISEASE_OF_UNCERTAIN_BEHAVIOR','NEOPLASM_OF_CONNECTIVE_TISSUES','NEOPLASM_OF_MUSCLE','NEOPLASM_OF_TRUNK','NEOPLASM_OF_BACK','NEOPLASM_OF_BLOOD_VESSEL','NEOPLASM_OF_PLACENTA','NEOPLASM_OF_NERVOUS_SYSTEM','NEOPLASM_BY_BODY_SITE','FETAL_NEOPLASM','HEMATOLOGIC_NEOPLASM','NERVE_ROOT_AND_PLEXUS_COMPRESSIONS_IN_NEOPLASTIC_DISEASE','BENIGN_NEOPLASTIC_DISEASE','RECURRENT_TUMOR','POST_TRANSPLANT_NEOPLASIA','LIPOMATOUS_TUMOR','NEUROENDOCRINE_TUMOR','TUMOR_OF_UNKNOWN_ORIGIN_OR_ILL_DEFINED_SITE','TUMOR_OF_UNKNOWN_ORIGIN','NEOPLASM_OF_HEAD_AND_NECK','LOCAL_TUMOR_SPREAD','PERICARDITIS_SECONDARY_TO_NEOPLASIA','CHONDROMATOSIS','NEOPLASM_OF_EXTREMITY','NEOPLASM_OF_MUSCULOSKELETAL_SYSTEM','NEOPLASTIC_COMPLICATION_OF_PROCEDURE','NEOPLASTIC_SEQUELAE_OF_DISORDERS','RUPTURE_OF_NEOPLASM','NEOPLASM_OF_SOFT_TISSUE','NEOPLASM_OF_ENDOCRINE_SYSTEM','GLIOMA','CHROMAFFINOMA','MELANOCYTIC_NEOPLASM','NEOPLASM_OF_INTEGUMENTARY_SYSTEM','INTRAEPITHELIAL_NEOPLASIA_DUE_TO_HUMAN_PAPILLOMAVIRUS','SQUAMOUS_NEOPLASM_OF_SURFACE_EPITHELIUM','NEOPLASM_OF_NERVE_SHEATH_ORIGIN','GERM_CELL_TUMOR','PIGMENTED_NEUROECTODERMAL_TUMOR_OF_INFANCY','NEOPLASM_OF_HEMATOPOIETIC_CELL_TYPE','GESTATIONAL_TROPHOBLASTIC_DISEASE','HORMONE_RECEPTOR_POSITIVE_TUMOR','ADDITIONAL_NEOPLASM_CLASSIFICATION_TERMS','HORMONE_RECEPTOR_NEGATIVE_NEOPLASM','GIANT_CELL_TUMOR','THYMOMA','RESIDUAL_TROPHOBLASTIC_DISEASE','TUMOR_OF_RESPIRATORY_SYSTEM','FAMILIAL_NEOPLASTIC_DISEASE','DICER1_SYNDROME','NEOPLASM_OF_CARDIOVASCULAR_SYSTEM','ECTOPIC_ALDOSTERONE_PRODUCING_NEOPLASM','HIRSCHSPRUNG_DISEASE_GANGLIONEUROBLASTOMA_SYNDROME','NEOPLASTIC_PLEURAL_EFFUSION','ADENOCARCINOMA_IN_SITU_IN_VILLOUS_ADENOMA','ANGIOMATOSIS_OF_RETINA','PULMONARY_CAPILLARY_HEMANGIOMATOSIS','SYSTEMIC_LYMPHANGIOMATOSIS','BREGEATS_SYNDROME','MULTIPLE_PROGRESSIVE_HEMANGIOMATA','ACQUIRED_HEMANGIOMATOSIS','ULCERO_MUTILATING_HEMANGIOMATOSIS','LYMPHANGIOMATOSIS','SEGMENTAL_LYMPHANGIOMATOSIS','ANGIOMATOSIS_OF_MENINGES','BACILLARY_ANGIOMATOSIS','CONGENITAL_CUTANEOUS_ANGIOMATOSIS','CEREBELLAR_HEMANGIOBLASTOMATOSIS','PLACENTAL_HEMANGIOMA_SYNDROME','ENOSTOSIS_OF_TALUS','ENOSTOSIS_OF_FIBULA','ENOSTOSIS_OF_PELVIS','ENOSTOSIS_OF_FEMUR','ENOSTOSIS_OF_ULNA','ENOSTOSIS_OF_HUMERUS','ENOSTOSIS_OF_RADIUS','ENOSTOSIS_OF_VERTEBRA','HAMARTOMA_OF_STOMACH','HAMARTOMA_OF_TONGUE','LIVER_HAMARTOMA','HAMARTOMA_OF_INTESTINE','HAMARTOMA_OF_LUNG','VASCULAR_HAMARTOMAS','HAMARTOMA_OF_BRAIN','HAMARTOMA_OF_MUSCLE','CONGENITAL_HAMARTOMA','LIPOMATOUS_HAMARTOMA','SPLENIC_HAMARTOMA','HAMARTOMA_OF_INTEGUMENT','LENTIGINOSIS','HAMARTOMA_OF_RETINA','LENTIGO_OF_LIP','JUVENILE_POLYPOSIS_SYNDROME') DEFAULT NULL,
  `olliers_disease` bit(1) DEFAULT NULL,
  `paget_disease` bit(1) DEFAULT NULL,
  `peripheral_vascular_disease` bit(1) DEFAULT NULL,
  `previous_cancer_treatment` enum('CHEMOTHERAPY','RADIATION','SURGERY','COM_MED_THER_REV','IMMUNOTHERAPY') DEFAULT NULL,
  `race` enum('WHITE','BLACK','ASIAN_PACIFIC_ISLANDERS','AMERICAN_INDIAN_ALASKA_NATIVE') DEFAULT NULL,
  `retinoblastoma` bit(1) DEFAULT NULL,
  `rothmund_thomson_syndrome` bit(1) DEFAULT NULL,
  `smoking` enum('CURRENT_SMOKER','FORMER_SMOKER','NEVER_SMOKER') DEFAULT NULL,
  `solid_tumor_non_metastatic` bit(1) DEFAULT NULL,
  `ulcer` bit(1) DEFAULT NULL,
  `werner_syndrome` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table idea4rc_dm.patient_follow_up
DROP TABLE IF EXISTS `patient_follow_up`;
CREATE TABLE IF NOT EXISTS `patient_follow_up` (
  `id` bigint(20) NOT NULL,
  `date_of_new_cancer_diagnosis` datetime(6) DEFAULT NULL,
  `last_contact` datetime(6) DEFAULT NULL,
  `new_cancer_diagnosis` enum('YES','NO') DEFAULT NULL,
  `new_cancer_topography` varchar(255) DEFAULT NULL,
  `patient_follow_up_date` datetime(6) DEFAULT NULL,
  `status_at_last_follow_up` enum('NED','DOD','DOC','DUC','AWD') DEFAULT NULL,
  `patient` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbp1vwjkt902mv3b30ignlr3pj` (`patient`),
  CONSTRAINT `FKbp1vwjkt902mv3b30ignlr3pj` FOREIGN KEY (`patient`) REFERENCES `patient` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table idea4rc_dm.radiotherapy
DROP TABLE IF EXISTS `radiotherapy`;
CREATE TABLE IF NOT EXISTS `radiotherapy` (
  `id` bigint(20) NOT NULL,
  `episode_event` bigint(20) DEFAULT NULL,
  `adaptive_rt` bit(1) DEFAULT NULL,
  `beam_quality` enum('EXT_BEAM_RT_PHOTONS','EXT_BEAM_RT_ELECTRONS','EXT_BEAM_RT_CARB_IONS','EXT_BEAM_RT_PROTONS','INTERST_BRACHY_THERAPY','RADIONUCLIDE_THERAPY','NEUTRON_CAPT_THERAPY','THERAPY') DEFAULT NULL,
  `bone` bit(1) DEFAULT NULL,
  `clinical_treatment_response` enum('COMPLETE_REMISSION','PARTIAL_REMISSION','STABLE_DISEASE','PROGRESSION') DEFAULT NULL,
  `distant_metastasis` bit(1) DEFAULT NULL,
  `end_date` datetime(6) DEFAULT NULL,
  `igrt` bit(1) DEFAULT NULL,
  `intent` enum('PALLIATIVE','CURATIVE') DEFAULT NULL,
  `liver` bit(1) DEFAULT NULL,
  `lung` bit(1) DEFAULT NULL,
  `mediastinum` bit(1) DEFAULT NULL,
  `neck_only` bit(1) DEFAULT NULL,
  `number_of_fractions` float DEFAULT NULL,
  `other_specify` varchar(255) DEFAULT NULL,
  `primary_and_bilateral_neck` bit(1) DEFAULT NULL,
  `primary_and_ipsilateral_neck` bit(1) DEFAULT NULL,
  `primary_only` bit(1) DEFAULT NULL,
  `radiotherapy` varchar(255) DEFAULT NULL,
  `rdh_enddate` datetime(6) DEFAULT NULL,
  `rdh_startdate` datetime(6) DEFAULT NULL,
  `regional_deep_hyperthemia` enum('ENUM') DEFAULT NULL,
  `setting` enum('PREOPERATIVE_RT','POSTOPERATIVE_RT') DEFAULT NULL,
  `soft_tissue` bit(1) DEFAULT NULL,
  `start_date` datetime(6) DEFAULT NULL,
  `total_dose_gy` float DEFAULT NULL,
  `treatment_completed_as_planned` enum('RT_COMPLETED','POIS_DRUG_MDE_SUBSTANCE','CANC_TREATM_MORBID','INTOLERANCE','DEATH') DEFAULT NULL,
  `treatment_technique` enum('TWO_D_BEAM_RT','THREE_D_BEAM_RT','INTENS_MOD_RT','VOL_MOD_ARC_THERAPY','TOMOTHERAPY','STEREOTACT_RT','UH_DOSE_RATE_RT','EXT_BEAM_RT_SCATTERING','EXT_BEAM_RT_PROTONS','TECHNIQUE') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_7wlxmwwkxdunqrvw5i5a3phb8` (`episode_event`),
  CONSTRAINT `FK_7wlxmwwkxdunqrvw5i5a3phb8` FOREIGN KEY (`episode_event`) REFERENCES `episode_event` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table idea4rc_dm.sarcoma_stage
DROP TABLE IF EXISTS `sarcoma_stage`;
CREATE TABLE IF NOT EXISTS `sarcoma_stage` (
  `id` bigint(20) NOT NULL,
  `bone` bit(1) DEFAULT NULL,
  `brain` bit(1) DEFAULT NULL,
  `distant_lymph_node` bit(1) DEFAULT NULL,
  `liver` bit(1) DEFAULT NULL,
  `lung` bit(1) DEFAULT NULL,
  `other_viscera` bit(1) DEFAULT NULL,
  `peritoneum` bit(1) DEFAULT NULL,
  `pleura` bit(1) DEFAULT NULL,
  `soft_tissue` bit(1) DEFAULT NULL,
  `unknown` bit(1) DEFAULT NULL,
  `episode_event` bigint(20) DEFAULT NULL,
  `localised` enum('CONFINED_DISEASE','N_TUMOR_NODULES') DEFAULT NULL,
  `loco_regional` enum('INVASIVE_DISEASE','TRANSIT_METASTASIS_CLINIC_CONF','MULTIFOCAL_TUMOR') DEFAULT NULL,
  `regional_nodal_metastases` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_514jr2ytgc82aowkxqqailvce` (`episode_event`),
  CONSTRAINT `FK_514jr2ytgc82aowkxqqailvce` FOREIGN KEY (`episode_event`) REFERENCES `episode_event` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table idea4rc_dm.surgery
DROP TABLE IF EXISTS `surgery`;
CREATE TABLE IF NOT EXISTS `surgery` (
  `id` bigint(20) NOT NULL,
  `episode_event` bigint(20) DEFAULT NULL,
  `date_of_neck_surgey` datetime(6) DEFAULT NULL,
  `date_of_surgery` datetime(6) DEFAULT NULL,
  `date_of_surgery_onm` datetime(6) DEFAULT NULL,
  `isolated_limb_perfusion` bit(1) DEFAULT NULL,
  `laterality_of_the_dissection` enum('IPSILATERAL','BILATERAL_SAMPLING','CONTROLATERAL') DEFAULT NULL,
  `margins_after_surgery` enum('NO_RESIDUAL_TUMOR','MICROSCOPIC_RESIDUAL_TUMOR','MACROSCOPIC_RESIDUAL_TUMOR') DEFAULT NULL,
  `neck_surgery` enum('YES','NO') DEFAULT NULL,
  `reconstruction` enum('YES','NO') DEFAULT NULL,
  `site_of_surgery_on_metastasis_bone` bit(1) DEFAULT NULL,
  `site_of_surgery_on_metastasis_brain` bit(1) DEFAULT NULL,
  `site_of_surgery_on_metastasis_distant_lymph_nodes` bit(1) DEFAULT NULL,
  `site_of_surgery_on_metastasis_liver` bit(1) DEFAULT NULL,
  `site_of_surgery_on_metastasis_lung` bit(1) DEFAULT NULL,
  `site_of_surgery_on_metastasis_other_viscera` bit(1) DEFAULT NULL,
  `site_of_surgery_on_metastasis_peritoneum` bit(1) DEFAULT NULL,
  `site_of_surgery_on_metastasis_pleura` bit(1) DEFAULT NULL,
  `site_of_surgery_on_metastasis_soft_tissue` bit(1) DEFAULT NULL,
  `site_of_surgery_on_metastasis_unknown` bit(1) DEFAULT NULL,
  `surgery_hospital` varchar(255) DEFAULT NULL,
  `surgery_intention` enum('PALLIATIVE','CURATIVE') DEFAULT NULL,
  `surgery_onm` enum('YES','NO') DEFAULT NULL,
  `surgery_type` enum('SURGICAL_PROCEDURE','LOCAL_EXCISION','AMPUTATION','LIMB_OPERATION') DEFAULT NULL,
  `surgical_complications` enum('NO_COMPLICATION','CLA_DINDO_SCALE_I','CLA_DINDO_SCALE_II','CLA_DINDO_SCALE_III','CLA_DINDO_SCALE_IIIA','CLA_DINDO_SCALE_IIIB','CLA_DINDO_SCALE_IV','CLA_DINDO_SCALE_IVA','CLA_DINDO_SCALE_IVB','CLA_DINDO_SCALE_V') DEFAULT NULL,
  `surgical_specimen_grading_only_in_untreated_tumours` enum('GRADE_1','GRADE_2','GRADE_3','GRADE_H','GRADE_L') DEFAULT NULL,
  `surgical_specimen_mitotic_count` float DEFAULT NULL,
  `tumor_rupture` enum('TUMOR_RUPTURE') DEFAULT NULL,
  `type_of_surgical_approach_on_tumour` enum('EXTERNAL_OPEN','TRANSNASAL','TRANSORBITAL','TRANSORAL','CRANIOFACIAL') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_mnuexvyojmf1rwlreyjtld6h6` (`episode_event`),
  CONSTRAINT `FK_mnuexvyojmf1rwlreyjtld6h6` FOREIGN KEY (`episode_event`) REFERENCES `episode_event` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table idea4rc_dm.systemic_treatment
DROP TABLE IF EXISTS `systemic_treatment`;
CREATE TABLE IF NOT EXISTS `systemic_treatment` (
  `id` bigint(20) NOT NULL,
  `episode_event` bigint(20) DEFAULT NULL,
  `chemotherapy_info` enum('PREOPERATIVE','POST_OPERATIVE','HYPERTHE_INTRAPERIT_CHEMO','THERAPEUTIC') DEFAULT NULL,
  `end_date_regimen_changed` datetime(6) DEFAULT NULL,
  `end_date_systemic_treatment` datetime(6) DEFAULT NULL,
  `intent` enum('PALLIATIVE','CURATIVE') DEFAULT NULL,
  `number_of_cycles_administrations` float DEFAULT NULL,
  `reason_for_end_of_treatment` enum('TREAT_COMPLETED','POIS_DRUG_MDE_SUBSTANCE','CANC_TREATM_MORBID','INTOLERANCE','PROC_DISCONTINUED','DEATH') DEFAULT NULL,
  `setting` enum('NEO_ADJIUVANT','ADJUVANT') DEFAULT NULL,
  `start_date_regimen_changed` datetime(6) DEFAULT NULL,
  `start_date_systemic_treatment` datetime(6) DEFAULT NULL,
  `treatment_response` enum('COMPLETE_REMISSION','PARTIAL_REMISSION','STABLE_DISEASE','PROGRESSION') DEFAULT NULL,
  `type_of_systemic_treatment` enum('CHEMOTHERAPY','IMMUNOTHERAPY','TARGET_THERAPY') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_9udprs595o6gp9saibewrjdhh` (`episode_event`),
  CONSTRAINT `FK_9udprs595o6gp9saibewrjdhh` FOREIGN KEY (`episode_event`) REFERENCES `episode_event` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table idea4rc_dm.table_generator
DROP TABLE IF EXISTS `table_generator`;
CREATE TABLE IF NOT EXISTS `table_generator` (
  `sequence_name` varchar(255) NOT NULL,
  `next_val` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`sequence_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table idea4rc_dm.treatment_response
DROP TABLE IF EXISTS `treatment_response`;
CREATE TABLE IF NOT EXISTS `treatment_response` (
  `id` bigint(20) NOT NULL,
  `treatment_response` enum('COMPLETE_REMISSION','PARTIAL_REMISSION','STABLE_DISEASE','PROGRESSION') DEFAULT NULL,
  `treatment_response_defined_done` varchar(255) DEFAULT NULL,
  `episode_event` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_gpjixnacsvi2c67a2bk0b9hxx` (`episode_event`),
  CONSTRAINT `FKn8n2abbid04q0jt2dfbu0dmbw` FOREIGN KEY (`episode_event`) REFERENCES `episode_event` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
