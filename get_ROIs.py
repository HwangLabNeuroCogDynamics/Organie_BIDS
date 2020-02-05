# list of FP ROIs
# 64-114
# 122-134
# 136-167
# 173-189
# 195-201
# 264-273
# 274-318
# 325-336
# 338-358
# 359-376
# 377-387
# 391-401

ROIs = np.concatenate((np.arange(64,113), 
np.arange(122,134),
np.arange(136,167),    
np.arange(173,189),
np.arange(195,201),
np.arange(264,273),
np.arange(325,336),
np.arange(338,358),
np.arange(359,376),
np.arange(377,387),
np.arange(391,401),
))

df = pd.read_csv('yeo_PC.csv')
for index, row in df.iterrows():
	#print row, index
	if row['ROI'] not in ROIs:
		df.drop(index, inplace = True)

df.to_csv('yeo_FP_PC.csv')

df = pd.read_csv('yeo_WMD.csv')
for index, row in df.iterrows():
	#print row, index
	if row['ROI'] not in ROIs:
		df.drop(index, inplace = True)

df.to_csv('yeo_FP_WMD.csv')