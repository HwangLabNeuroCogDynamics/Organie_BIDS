

heudiconv -d /data/backed_up/shared/MRRF_Seq_Test/{subject}/SCANS/*/*/* -s \
20200212_TEST -c dcm2niix -b -o /data/backed_up/shared/MRRF_Seq_Test/BIDS_2020_3T/ \
-f /home/kahwang/bin/Organize_BIDS/mrrf_convert.py

## Will then need to edit the fmap/*.json to include the "IntendedFor" field:
#  "IntendedFor": ["func/sub-20200130_task-MB3_run-001_bold.nii.gz", "func/sub-20200130_task-MB2_run-001_bold.nii.gz"	
#],

singularity exec -B /data:/data /opt/mriqc/mriqc.simg mriqc /data/backed_up/shared/MRRF_Seq_Test/BIDS_2020_3T/ /data/backed_up/shared/MRRF_Seq_Test/MRIQC/ participant --participant_label 20200212TEST --n_procs 12 --ants-nthreads 12

singularity run --cleanenv -B /data:/data /opt/mriqc/mriqc.simg /data/backed_up/shared/MRRF_Seq_Test/BIDS_2020_3T/ /data/backed_up/shared/MRRF_Seq_Test/MRIQC/ participant --participant_label 20200130 --n_procs 12 --ants-nthreads 12


singularity run --cleanenv -B /data:/data /opt/fmriprep/fmriprep.simg \
/data/backed_up/shared/MRRF_Seq_Test/BIDS_2020_3T /data/backed_up/shared/MRRF_Seq_Test/fmpaptest \
participant --participant_label 20200212TEST --nthreads 16 --omp-nthreads 16 \
-w /data/backed_up/shared/MRRF_Seq_Test/work2/