arguments:
- position: 0
  valueFrom: sentinel_runtime=cores,$(runtime['cores']),ram,$(runtime['ram'])
- sentinel_parallel=batch-single
- sentinel_outputs=sv_rec:sv__variantcaller;sv__vrn_file;description;resources;genome_build;config__algorithm__tools_off;analysis;config__algorithm__tools_on;work_bam_plus__disc;work_bam_plus__sr;depth__bins__normalized;depth__bins__target;depth__bins__antitarget;regions__bins__target;regions__bins__antitarget;regions__bins__group;reference__fasta__base;config__algorithm__svcaller;config__algorithm__coverage_interval;genome_resources__rnaseq__gene_bed;metadata__batch;metadata__phenotype;config__algorithm__sv_regions;config__algorithm__variant_regions;align_bam;config__algorithm__variant_regions_merged;depth__variant_regions__regions;config__algorithm__callable_regions
- sentinel_inputs=sv_batch_rec:record
baseCommand:
- bcbio_nextgen.py
- runfn
- detect_sv
- cwl
class: CommandLineTool
cwlVersion: v1.0
hints:
- class: DockerRequirement
  dockerImageId: quay.io/bcbio/bcbio-vc
  dockerPull: quay.io/bcbio/bcbio-vc
- class: ResourceRequirement
  coresMin: 2
  outdirMin: 1034
  ramMin: 4096
  tmpdirMin: 10
- class: SoftwareRequirement
  packages:
  - package: bedtools
    specs:
    - https://anaconda.org/bioconda/bedtools
  - package: cnvkit
    specs:
    - https://anaconda.org/bioconda/cnvkit
  - package: delly
    specs:
    - https://anaconda.org/bioconda/delly
  - package: extract-sv-reads
    specs:
    - https://anaconda.org/bioconda/extract-sv-reads
  - package: lumpy-sv
    specs:
    - https://anaconda.org/bioconda/lumpy-sv
  - package: manta
    specs:
    - https://anaconda.org/bioconda/manta
  - package: mosdepth
    specs:
    - https://anaconda.org/bioconda/mosdepth
  - package: samtools
    specs:
    - https://anaconda.org/bioconda/samtools
  - package: seq2c
    specs:
    - https://anaconda.org/bioconda/seq2c
  - package: simple_sv_annotation
    specs:
    - https://anaconda.org/bioconda/simple_sv_annotation
  - package: svtools
    specs:
    - https://anaconda.org/bioconda/svtools
  - package: svtyper
    specs:
    - https://anaconda.org/bioconda/svtyper
  - package: r
    specs:
    - https://anaconda.org/bioconda/r
    version:
    - 3.4.1
  - package: vawk
    specs:
    - https://anaconda.org/bioconda/vawk
inputs:
- id: sv_batch_rec
  type:
    items:
      fields:
      - name: description
        type: string
      - name: resources
        type: string
      - name: genome_build
        type: string
      - name: config__algorithm__tools_off
        type:
          items:
          - 'null'
          - string
          type: array
      - name: analysis
        type: string
      - name: config__algorithm__tools_on
        type:
          items:
          - 'null'
          - string
          type: array
      - name: work_bam_plus__disc
        type:
        - File
        - 'null'
      - name: work_bam_plus__sr
        type:
        - File
        - 'null'
      - name: depth__bins__normalized
        type:
        - File
        - 'null'
      - name: depth__bins__target
        type:
        - File
        - 'null'
      - name: depth__bins__antitarget
        type:
        - File
        - 'null'
      - name: regions__bins__target
        type:
        - File
        - 'null'
      - name: regions__bins__antitarget
        type:
        - File
        - 'null'
      - name: regions__bins__group
        type:
        - string
        - 'null'
      - name: reference__fasta__base
        type: File
      - name: config__algorithm__svcaller
        type: string
      - name: config__algorithm__coverage_interval
        type: string
      - name: genome_resources__rnaseq__gene_bed
        type: File
      - name: metadata__batch
        type: string
      - name: metadata__phenotype
        type: string
      - name: config__algorithm__sv_regions
        type: File
      - name: config__algorithm__variant_regions
        type: File
      - name: align_bam
        type: File
      - name: config__algorithm__variant_regions_merged
        type: File
      - name: depth__variant_regions__regions
        type: File
      - name: config__algorithm__callable_regions
        type: File
      name: sv_batch_rec
      type: record
    type: array
outputs:
- id: sv_rec
  type:
    items:
      fields:
      - name: sv__variantcaller
        type:
        - string
        - 'null'
      - name: sv__vrn_file
        type:
        - File
        - 'null'
      - name: description
        type: string
      - name: resources
        type: string
      - name: genome_build
        type: string
      - name: config__algorithm__tools_off
        type:
          items:
          - 'null'
          - string
          type: array
      - name: analysis
        type: string
      - name: config__algorithm__tools_on
        type:
          items:
          - 'null'
          - string
          type: array
      - name: work_bam_plus__disc
        type:
        - File
        - 'null'
      - name: work_bam_plus__sr
        type:
        - File
        - 'null'
      - name: depth__bins__normalized
        type:
        - File
        - 'null'
      - name: depth__bins__target
        type:
        - File
        - 'null'
      - name: depth__bins__antitarget
        type:
        - File
        - 'null'
      - name: regions__bins__target
        type:
        - File
        - 'null'
      - name: regions__bins__antitarget
        type:
        - File
        - 'null'
      - name: regions__bins__group
        type:
        - string
        - 'null'
      - name: reference__fasta__base
        type: File
      - name: config__algorithm__svcaller
        type: string
      - name: config__algorithm__coverage_interval
        type: string
      - name: genome_resources__rnaseq__gene_bed
        type: File
      - name: metadata__batch
        type: string
      - name: metadata__phenotype
        type: string
      - name: config__algorithm__sv_regions
        type: File
      - name: config__algorithm__variant_regions
        type: File
      - name: align_bam
        type: File
      - name: config__algorithm__variant_regions_merged
        type: File
      - name: depth__variant_regions__regions
        type: File
      - name: config__algorithm__callable_regions
        type: File
      name: sv_rec
      type: record
    type: array
requirements:
- class: InlineJavascriptRequirement
- class: InitialWorkDirRequirement
  listing:
  - entry: $(JSON.stringify(inputs))
    entryname: cwl.inputs.json
