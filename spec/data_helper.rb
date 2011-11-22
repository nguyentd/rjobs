class DataHelper
  def self.jobAttributes
    @@jobAttributes
  end

  def self.jobSubmit
    @@jobSubmit
  end

  @@jobAttributes = '<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>jobAttributes</key>
  <dict>
    <key>activeCPUPower</key>
    <string>0</string>
    <key>applicationIdentifier</key>
    <string>com.apple.xgrid.cli</string>
    <key>dateNow</key>
    <date>2011-11-17T06:21:15Z</date>
    <key>dateStarted</key>
    <date>2011-11-15T14:44:53Z</date>
    <key>dateStopped</key>
    <date>2011-11-15T14:44:53Z</date>
    <key>dateSubmitted</key>
    <date>2011-11-15T14:44:53Z</date>
    <key>jobStatus</key>
    <string>Finished</string>
    <key>name</key>
    <string>MyFirstJob</string>
    <key>percentDone</key>
    <real>100</real>
    <key>taskCount</key>
    <string>1</string>
    <key>undoneTaskCount</key>
    <string>0</string>
  </dict>
</dict>
</plist>'

  @@jobSubmit = '<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>jobIdentifier</key>
  <string>11</string>
</dict>
</plist>
'

end
