---
title: copy-stream
date: 2020-03-08
categories: ['io']
draft: false
---

```
  public static void copyStream(final InputStream input, final OutputStream output)
      throws IOException {
    final byte[] buffer = new byte[1024];
    int bytesRead;
    while ((bytesRead = input.read(buffer)) != -1) {
      output.write(buffer, 0, bytesRead);
    }
  }

```

```
	public static void copy(InputStream in, OutputStream out) throws IOException {
		try {
			byte[] buffer = new byte[BLOCK_SIZE];
			int nrOfBytes = -1;
			while ((nrOfBytes = in.read(buffer)) != -1) {
				out.write(buffer, 0, nrOfBytes);
			}
			out.flush();
		}
		finally {
			try {
				in.close();
			}
			catch (IOException ex) {
				logger.warn("Could not close InputStream", ex);
			}
			try {
				out.close();
			}
			catch (IOException ex) {
				logger.warn("Could not close OutputStream", ex);
			}
		}
	}
```

```
public static void copy(Reader in, Writer out) throws IOException {
		try {
			char[] buffer = new char[BLOCK_SIZE];
			int nrOfBytes = -1;
			while ((nrOfBytes = in.read(buffer)) != -1) {
				out.write(buffer, 0, nrOfBytes);
			}
			out.flush();
		}
		finally {
			try {
				in.close();
			}
			catch (IOException ex) {
				logger.warn("Could not close Reader", ex);
			}
			try {
				out.close();
			}
			catch (IOException ex) {
				logger.warn("Could not close Writer", ex);
			}
		}
	}


```
