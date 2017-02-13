require('cutorch')
local matio = require 'matio'
cmd = torch.CmdLine()

cmd:option('-inputDir', './input/', 'neural network model')
cmd:option('-outputDir', './output/', 'neural network model')

params = cmd:parse(arg)


function alphanumsort(o)
  local function padnum(d) local dec, n = string.match(d, "(%.?)0*(.+)")
    return #dec > 0 and ("%.12f"):format(d) or ("%s%03d%s"):format(dec, #n, n) end
  table.sort(o, function(a,b)
    return tostring(a):gsub("%.?%d+",padnum)..("%3d"):format(#b)
         < tostring(b):gsub("%.?%d+",padnum)..("%3d"):format(#a) end)
  return o
end

function getFilesInDir(dir,ext)
  files = {}

  -- Go over all files in directory. We use an iterator, paths.files().
  for file in paths.files(dir) do
     -- We only load files that match the extension
     if file:find(ext .. '$') then
        -- and insert the ones we care about in our table
        table.insert(files, paths.concat(dir,file))
     end
  end

  -- Check files
  if #files == 0 then
     error('given directory doesnt contain any files of type: ' .. opt.ext)
  end

  -- 3. Sort file names

  -- We sort files alphabetically, it's quite simple with table.sort()

  --table.sort(files, function (a,b) return a < b end)

  files = alphanumsort(files)

  print('Found files:')
  print(#files)

  return files
end

files = getFilesInDir(params.inputDir,'.mat')

for i=1,#files do
  print('Processing',i)
  print('Loading.. ',files[i])
  data = matio.load(files[i])
  data = data.grid
  print('Grid: ',#data)
  torch.save(files[i]..'.grid',data)
end

os.execute('cp '..params.inputDir..'*.grid '..params.outputDir)
os.execute('rm '..params.inputDir..'*.grid')

print('DOne')