$namespaces:
  arv: http://arvados.org/cwl#
  dx: https://www.dnanexus.com/cwl#
arguments:
- position: 0
  valueFrom: sentinel_runtime=cores,$(runtime['cores']),ram,$(runtime['ram'])
- sentinel_parallel=multi-parallel
- sentinel_outputs=qcout_rec:summary__qc;summary__metrics;description;resources;reference__fasta__base;config__algorithm__coverage_interval;genome_build;genome_resources__rnaseq__transcripts;config__algorithm__tools_off;config__algorithm__qc;analysis;config__algorithm__tools_on;work_bam
- sentinel_inputs=qc_rec:record
baseCommand:
- bcbio_nextgen.py
- runfn
- pipeline_summary
- cwl
class: CommandLineTool
cwlVersion: v1.0
hints:
- class: DockerRequirement
  dockerImageId: quay.io/bcbio/bcbio-rnaseq
  dockerPull: quay.io/bcbio/bcbio-rnaseq
- class: ResourceRequirement
  coresMin: 2
  outdirMin: 1024
  ramMin: 4096
  tmpdirMin: 0
- class: dx:InputResourceRequirement
  indirMin: 1
- class: SoftwareRequirement
  packages:
  - package: bedtools
    specs:
    - https://anaconda.org/bioconda/bedtools
  - package: fastqc
    specs:
    - https://anaconda.org/bioconda/fastqc
  - package: goleft
    specs:
    - https://anaconda.org/bioconda/goleft
  - package: mosdepth
    specs:
    - https://anaconda.org/bioconda/mosdepth
  - package: picard
    specs:
    - https://anaconda.org/bioconda/picard
  - package: pythonpy
    specs:
    - https://anaconda.org/bioconda/pythonpy
  - package: qsignature
    specs:
    - https://anaconda.org/bioconda/qsignature
  - package: qualimap
    specs:
    - https://anaconda.org/bioconda/qualimap
  - package: samtools
    specs:
    - https://anaconda.org/bioconda/samtools
- class: arv:RuntimeConstraints
  keep_cache: 4096
inputs:
- id: qc_rec
  type:
    fields:
    - name: description
      type: string
    - name: resources
      type: string
    - name: reference__fasta__base
      type: File
    - name: config__algorithm__coverage_interval
      type:
      - 'null'
      - string
    - name: genome_build
      type: string
    - name: genome_resources__rnaseq__transcripts
      type: File
    - name: config__algorithm__tools_off
      type:
      - 'null'
      - string
      - items:
        - 'null'
        - string
        type: array
    - name: config__algorithm__qc
      type:
        items: string
        type: array
    - name: analysis
      type: string
    - name: config__algorithm__tools_on
      type:
      - 'null'
      - string
      - items:
        - 'null'
        - string
        type: array
    - name: work_bam
      type: File
    name: qc_rec
    type: record
outputs:
- id: qcout_rec
  type:
    fields:
    - name: summary__qc
      type:
      - File
      - 'null'
    - name: summary__metrics
      type:
      - string
      - 'null'
    - name: description
      type: string
    - name: resources
      type: string
    - name: reference__fasta__base
      type: File
    - name: config__algorithm__coverage_interval
      type:
      - 'null'
      - string
    - name: genome_build
      type: string
    - name: genome_resources__rnaseq__transcripts
      type: File
    - name: config__algorithm__tools_off
      type:
      - 'null'
      - string
      - items:
        - 'null'
        - string
        type: array
    - name: config__algorithm__qc
      type:
        items: string
        type: array
    - name: analysis
      type: string
    - name: config__algorithm__tools_on
      type:
      - 'null'
      - string
      - items:
        - 'null'
        - string
        type: array
    - name: work_bam
      type: File
    name: qcout_rec
    type: record
requirements:
- class: InlineJavascriptRequirement
- class: InitialWorkDirRequirement
  listing:
  - entry: $(JSON.stringify(inputs))
    entryname: cwl.inputs.json
