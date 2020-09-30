import requests
import xml.etree.ElementTree as etree
import os

path_var='C:/CF_SERVER/cf_main/cfusion/wwwroot/CFIDE/'

url = "http://localhost:8500/CFIDE/administrator/index.cfm"
tool_url = "http://localhost:8500/CFIDE/administrator/tools/index.cfm"
payload = {
				'cfadminPassword': 'D033E22AE348AEB5660FC2140AEC35850C4DA997'
            }


if os.path.isfile("log.html"):
	os.remove("log.html")
#with open('message1.html', 'a') as log:
	#log.write("<html>")
xmlD=etree.parse("Sections.xml")
root=xmlD.getroot()
#print "**********"
for directory in root.findall('directory'):
    section=directory.get('name')
    input_dir=path_var+directory.find('inputdir').text
    input_file=directory.find('inputfile').text
    output_file=directory.find('outputfile').text
    output_dir=path_var+directory.find('outputdir').text
    lowpriority=directory.find('lowpriority').text
    load_data = {
            'section': section,
            'lowpriority': 'error',
            'inputdir' : input_dir,
            'inputfile' : input_file,
            'outputdir' : output_dir,
            'outputfile' : output_file,
            'commit' : 'true',
            'adminsubmit' : 'Execute Search'
            }
    #s.post(Form_URL,data=payload)
    #print r.text
    with requests.session() as s:
		# fetch the login page
		s.get(url)

		# post to the login form
		r = s.post(url, data=payload)

		s.get(tool_url)    
		#new = s.post(url1, data=payload1)
		new = s.post(tool_url, data=load_data)
		
		#filename="logs/"+section+".html"
		#f=open(filename,'w')
		#f.write(new.text.encode('ascii','ignore'))
		
#with open('message1.html', 'a') as log:
	#log.write("</html>")