--Will output the most updated version of each question in Common Assessment including its data definition
SELECT 
ectm.MODULE_SEQUENCE, ecmgm.GROUP_SEQUENCE, ecgm.QUESTION_SEQUENCE, 
T.EST_CA_TEMPLATE_ID, t.version_number, T.Effective_FROM_DATE,
m.MODULE_NAME_EN, m.MODULE_NAME_FR, ECG.GROUP_DESC, ECG.GROUP_DESC_FR, 
q.EST_CA_QUESTION_ID, q.parent_question_id, q.QUESTION_CODE_ID, q.PARENT_QUESTION_CODE,
q.UPDATED_DATE, q.CREATED_DATE, EST_CA_DATA_TYPE_NAME,
q.QUESTION_EN, q.QUESTION_FR, q.QUESTION_DESC_EN, q.QUESTION_DESC_FR, q.TOOLTIP_EN, q.TOOLTIP_FR
FROM (
SELECT
q.*,
CASE WHEN PARENT_QUESTION_ID = 0 THEN EST_CA_QUESTION_ID ELSE PARENT_QUESTION_ID END pqcode
FROM CA_CDR.EST_CA_QUESTION q
) q
LEFT JOIN CA_CDR.EST_CA_GRPQ_MAP 	ECGM 	ON 		q.PQCODE = ecgm.QUESTION_ID
LEFT JOIN CA_CDR.EST_CA_GROUP 		ECG 	ON 		ECGM.GROUP_ID = ECG.GROUP_ID
LEFT JOIN CA_CDR.EST_CA_MD_GRP_MAP 	ECMGM 	ON 		ECMGM.GROUP_ID = ECG.GROUP_ID
LEFT JOIN CA_CDR.EST_CA_MODULE 		m 		ON 		ECMGM.MODULE_ID = m.EST_CA_MODULE_ID
LEFT JOIN CA_CDR.EST_CA_TM_MAP 		ECTM 	ON 		m.EST_CA_MODULE_ID = ECTM.EST_CA_MODULE_ID
LEFT JOIN CA_CDR.EST_CA_TEMPLATE 	T 		ON 		ECTM.EST_CA_TEMPLATE_ID = T.EST_CA_TEMPLATE_ID
LEFT JOIN CA_CDR.EST_CA_DATA_TYPE 	ecdt 	ON		q.QUESTION_ANSWER_TYPE_IND = ecdt.EST_CA_DATA_TYPE_ID
WHERE t.EST_CA_TEMPLATE_ID = (SELECT max(EST_CA_TEMPLATE_ID) FROM CA_CDR.EST_CA_TEMPLATE)
AND MODULE_SEQUENCE != 0 
AND QUESTION_CODE_ID LIKE 'CA%'
ORDER BY ECTM.MODULE_SEQUENCE, ECMGM.GROUP_SEQUENCE, ECGM.QUESTION_SEQUENCE, q.Question_code_id 