heudiconv -d /data/backed_up/shared/MRRF_Seq_Test/{subject}/SCANS/*/*/* -s \
20200130 -c none -o /data/backed_up/shared/MRRF_Seq_Test/BIDS \
-f ~/bin/heudiconv/heudiconv/heuristics/convertall.py

heudiconv -d /data/backed_up/shared/MRRF_Seq_Test/{subject}/SCANS/*/*/* -s \
20200130 -c dcm2niix -b -o /data/backed_up/shared/MRRF_Seq_Test/BIDS_2020_3T \
-f /home/kahwang/bin/Organize_BIDS/mrrf_convert.py

singularity exec -B /data:/data /opt/mriqc/mriqc.simg mriqc /data/backed_up/shared/MRRF_Seq_Test/BIDS/ /data/backed_up/shared/MRRF_Seq_Test/MRIQC/ participant --participant_label 20200130 --n_procs 12 --ants-nthreads 12

singularity run --cleanenv -B /data:/data /opt/fmriprep/fmriprep.simg \
/data/backed_up/shared/MRRF_Seq_Test/BIDS_2020_3T /data/backed_up/shared/MRRF_Seq_Test/fMRIprep \
participant --skip_bids_validation --ignore slicetiming --participant_label 20200130 --nthreads 12 --omp-nthreads 12 \
-w /data/backed_up/shared/MRRF_Seq_Test/work/