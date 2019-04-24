

heudiconv -d /data/backed_up/shared/ThalHi_MRI/Raw/{subject}/SCANS/*/*/* -s 20190409 -c none -o /data/backed_up/shared/ThalHi_MRI/BIDS/ -f ~/bin/heudiconv/heudiconv/heuristics/convertall.py


heudiconv -d /data/backed_up/shared/ThalHi_MRI/Raw/{subject}/SCANS/*/*/*dcm -s 20190409 -c dcm2niix -b -o /data/backed_up/shared/ThalHi_MRI/BIDS/ -f ~/ThalHi_convert.py


singularity shell -B /data:/data /opt/mriqc/mriqc.simg 
#then
mriqc /data/backed_up/shared/ThalHi_MRI/BIDS/ /data/backed_up/shared/ThalHi_MRI/MRIQC/ participant --participant_label 20190409 --n_procs 8 --ants-nthreads 8

http_proxy=http://proxy.divms.uiowa.edu:8888
https_proxy=http://proxy.divms.uiowa.edu:8888
singularity run --cleanenv -B /data:/data /opt/fmriprep/fmriprep.simg /data/backed_up/shared/ThalHi_MRI/BIDS/ /data/backed_up/shared/ThalHi_MRI/fMRIprep participant --skip_bids_validation --ignore slicetiming --participant_label 20190409 --nthreads 8 --omp-nthreads 8



singularity exec -B $PWD/ds008_R2.0.0:/data:ro -B $PWD/out:/out /opt/mriqc/mriqc.simg mriqc /data /out participant --participant_label 15
