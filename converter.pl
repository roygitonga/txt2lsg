#===== perl script =======
#!/usr/bin/perl
open (ORGDB_PC,"<./list.txt");
@ODB_PC=<ORGDB_PC>;
close (ORGDB_PC);

$start_num="900";
$default_lang="en";
#############################

###########

foreach $rec_pc (@ODB_PC){
chomp($rec_pc);
($type,$a_type,$q_number,$q_text)=split(/\|/,$rec_pc);
if ($type eq "Q") {
$w_number=$start_num + $q_number;

$zz_qestions = qq^
<row>
<qid><![CDATA[$w_number]]></qid>
<gid><![CDATA[69]]></gid>
<type><![CDATA[$a_type]]></type>
<title><![CDATA[Q$w_number]]></title>
<question><![CDATA[$q_text]]></question>
<other><![CDATA[Y]]></other>
<mandatory><![CDATA[Y]]></mandatory>
<question_order><![CDATA[2]]></question_order>
<language><![CDATA[$default_lang]]></language>
<scale_id><![CDATA[0]]></scale_id>
<same_default><![CDATA[0]]></same_default>
<relevance><![CDATA[1]]></relevance>
</row>^;
$write_line_Q = "$write_line_Q$zz_qestions";
$zz_attr = qq^
<row>
<qid><![CDATA[$w_number]]></qid>
<attribute><![CDATA[1]]></attribute>
<value><![CDATA[1]]></value>
</row>^;
$write_line_attr = "$write_line_attr$zz_attr";
$lcount=1;
}
if ($type eq "A") {
$zz_answer = qq^
<row>
<qid><![CDATA[$w_number]]></qid>
<code><![CDATA[A$lcount]]></code>
<answer><![CDATA[$q_text]]></answer>
<assessment_value><![CDATA[0]]></assessment_value>
<sortorder><![CDATA[$lcount]]></sortorder>
<language><![CDATA[$default_lang]]></language>
<scale_id><![CDATA[0]]></scale_id>
</row>^;
$write_line_answer = "$write_line_answer$zz_answer";
$lcount++;

}



############################################
}


print qq^<?xml version="1.0" encoding="UTF-8"?>
<document>
<LimeSurveyDocType>Group</LimeSurveyDocType>
<DBVersion>164</DBVersion>
<languages>
<language>en</language>
</languages>
<groups>
<fields>
<fieldname>gid</fieldname>
<fieldname>group_name</fieldname>
<fieldname>language</fieldname>
</fields>
<rows>
<row>
<gid><![CDATA[69]]></gid>
<group_name><![CDATA[GROUP_NAME]]></group_name>
<language><![CDATA[$default_lang]]></language>
</row>
</rows>
</groups>
<questions>
<fields>
<fieldname>qid</fieldname>
<fieldname>gid</fieldname>
<fieldname>type</fieldname>
<fieldname>title</fieldname>
<fieldname>question</fieldname>
<fieldname>other</fieldname>
<fieldname>mandatory</fieldname>
<fieldname>question_order</fieldname>
<fieldname>language</fieldname>
<fieldname>scale_id</fieldname>
<fieldname>same_default</fieldname>
<fieldname>relevance</fieldname>
</fields>
<rows>
^;

print $write_line_Q;
print qq^
</rows>
</questions>
^;
print qq^<answers>
<fields>
<fieldname>qid</fieldname>
<fieldname>code</fieldname>
<fieldname>answer</fieldname>
<fieldname>assessment_value</fieldname>
<fieldname>sortorder</fieldname>
<fieldname>language</fieldname>
<fieldname>scale_id</fieldname>
</fields>
<rows>
^;
print $write_line_answer;
print qq^
</rows>
</answers>
<question_attributes>
<fields>
<fieldname>qid</fieldname>
<fieldname>attribute</fieldname>
<fieldname>value</fieldname>
<fieldname>language</fieldname>
</fields>
<rows>^;
print $write_line_attr;
print qq^
</rows>
</question_attributes>
</document>
^;
