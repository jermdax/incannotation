import os.path
import glob

def processFilepath(filepath):
  """TODO, not even sure how to summarize this"""
  print filepath + "-----"
  if filepath.endswith("/"):
    filepath = filepath[:-1]

  if os.path.isdir(filepath):
    for child in glob.glob(filepath + "/*"):
      processFilepath(child)
  elif os.path.isfile(filepath):
    print filepath
