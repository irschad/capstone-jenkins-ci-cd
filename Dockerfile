FROM python:3.7.3-stretch
	
WORKDIR /app
	
COPY . app.py /app/
	
RUN python -m pip install --trusted-host pypi.python.org -r requirements.txt

# Expose port 5000
EXPOSE 5000

# Run app.py at container launch
CMD ["python", "app.py"]
