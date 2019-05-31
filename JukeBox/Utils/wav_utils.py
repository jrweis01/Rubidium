import wave
import struct
import os
import tempfile

def get_temp_file_name():
	fd, temp_file = tempfile.mkstemp()
	os.close(fd)
	os.unlink(temp_file)
	return temp_file

def change_wav_volume(in_wav_path, out_wav_path, db):
	factor = 10**(db/20.0)

	in_wav = wave.open(in_wav_path, 'rb')
	sample_width = in_wav.getsampwidth()
	sample_max = 2**(8*sample_width-1)-1
	sample_min = -(sample_max + 1)

	wav_data_stream = in_wav.getfp()
	data = wav_data_stream.read()
	samples = [data[i:i+sample_width] for i in xrange(0, len(data), sample_width)]
	samples_int = [struct.unpack("<h", sample)[0] for sample in samples]

	new_samples_int = [sample*factor for sample in samples_int]
	new_samples_normalized = [max(sample_min, min(sample, sample_max)) for sample in new_samples_int]
	new_samples = ''.join([struct.pack("<h", sample) for sample in new_samples_normalized])

	out_wav = wave.open(out_wav_path, 'wb')
	out_wav.setparams(in_wav.getparams())
	out_wav.writeframes(new_samples)

	in_wav.close()
	out_wav.close()

def create_empty_wave(wav_path, copy_from_wav):
	in_wav = wave.open(copy_from_wav, 'rb')
	out_wav = wave.open(wav_path, 'wb')
	out_wav.setparams(in_wav.getparams())
	in_wav.close()
	return out_wav

def wav_to_wav(in_wav_path, out_wav_path):
	in_wav = wave.open(in_wav_path, 'rb')
	out_wav_path.writeframes(in_wav.readframes(in_wav.getnframes()))
	in_wav.close()

def add_quiet_to_wav(wav_path, quiet_time):
	frame_rate = wav_path.getframerate()
	channels = wav_path.getnchannels()
	sample_width = wav_path.getsampwidth()
	
	wav_path.writeframes("\x00"*quiet_time*frame_rate*channels*sample_width)

def get_wav_len(wav_path):
	"""
	Get the wav length in seconds
	"""
	wav = wave.open(wav_path, 'rb')
	return float(wav.getnframes())/wav.getframerate()