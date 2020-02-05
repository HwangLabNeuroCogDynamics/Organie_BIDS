

heudiconv -d /data/backed_up/shared/ThalHi_MRI/Raw/{subject}/SCANS/*/*/* -s 20190409 -c none -o /data/backed_up/shared/ThalHi_MRI/BIDS/ -f ~/bin/heudiconv/heudiconv/heuristics/convertall.py


heudiconv -d /data/backed_up/shared/ThalHi_MRI/Raw/{subject}/SCANS/*/*/*dcm -s 20190409 -c dcm2niix -b -o /data/backed_up/shared/ThalHi_MRI/BIDS/ -f ~/ThalHi_convert.py


singularity exec -B /data:/data /opt/mriqc/mriqc.simg \
mriqc /data/backed_up/shared/ThalHi_MRI/BIDS/ /data/backed_up/shared/ThalHi_MRI/MRIQC/ participant \
--participant_label 20190409 --n_procs 8 --ants-nthreads 8
#singularity exec -B /data/:/data:ro -B /data:/out /opt/mriqc/mriqc.simg mriqc /data /out participant --participant_label 20190409

http_proxy=http://proxy.divms.uiowa.edu:8888
https_proxy=http://proxy.divms.uiowa.edu:8888
singularity run --cleanenv -B /data:/data /opt/fmriprep/fmriprep.simg /data/backed_up/shared/ThalHi_MRI/BIDS/ /data/backed_up/shared/ThalHi_MRI/fMRIprep participant --skip_bids_validation --ignore slicetiming --participant_label 20190502 --nthreads 12 --omp-nthreads 12

