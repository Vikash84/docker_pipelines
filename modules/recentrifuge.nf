process recentrifuge {
      publishDir "${params.output}/${name}/recentrifuge", mode: 'copy', pattern: "${name}_recentrifuge_pavian_report_filtered.html"
      publishDir "${params.output}/${name}/recentrifuge", mode: 'copy', pattern: "${name}_recentrifuge_pavian_report_filtered.xlsx"
      label 'recentrifuge'
    input:
      tuple val(name), path(rcf_input) 
      path(database) 
    output:
      tuple val(name), path("${name}_recentrifuge_pavian_report_filtered.xlsx"), path("${name}_recentrifuge_pavian_report_filtered.html")
    shell:
      """
     
      rcf -n /database/ncbi_node  -f !{rcf_input} -o !{name}_recentrifuge_pavian_report_filtered.html
    
      """
}

// -c !{params.controls}
/*
 case "!{database}" in
      *.tar.gz)
        tar xzf !{database}
        ;;
      *.gz | *.tgz ) 
        gzip -d !{database}
        ;;
      *.tar)
        tar xf !{database}
        ;;
      esac
      
      DBname=\$(ls *.[1-9].cf | head -1 | cut -f1 -d".")
*/

