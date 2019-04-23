

heudiconv -d /data/backed_up/shared/ThalHi_MRI/Raw/{subject}/SCANS/*/*/* -s 20190409 -c none -o /data/backed_up/shared/ThalHi_MRI/BIDS/ -b -f ~/bin/heudiconv/heudiconv/heuristics/convertall.py
INFO: Running heudiconv version 0.5.4.dev1


heudiconv -d "/data/backed_up/shared/ThalHi_MRI/Raw/{subject}/SCANS/*/*/*dcm" -s 20190409 -c dcm2niix -o /data/backed_up/shared/ThalHi_MRI/BIDS/ -b -f ~/ThalHi_convert.py