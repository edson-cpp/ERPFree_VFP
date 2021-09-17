PUBLIC hdSerial
hdSerial = CREATEOBJECT("_hdSerial")

DEFINE CLASS _hdSerial as Custom
	FUNCTION init
		#Define MAX_FILENAME_LEN 256
		DECLARE Integer GetVolumeInformation IN Win32API;
			string lpRootPathName,;
			string lpVolumeNameBuffer,;
			integer nVolumeNameSize,;
			integer @lpVolumeSerialNumber,;
			integer @lpMaximumComponentLength,;
			integer @lpFileSystemFlags,;
			string lpFileSystemNameBuffer ,;
			integer nFileSystemNameSize
	ENDFUNC
	FUNCTION GetSerial(unit as String)
		LOCAL ser,i,j,s,s2
		STORE 0 TO ser,i,j
		STORE SPACE(128) TO s,s2
		x = GetVolumeInformation(unit,s,MAX_FILENAME_LEN,@ser,@i,@j,s2,MAX_FILENAME_LEN)
		ser = ALLTRIM(STR(ser, 25))
		RETURN ser
	ENDFUNC
ENDDEFINE
