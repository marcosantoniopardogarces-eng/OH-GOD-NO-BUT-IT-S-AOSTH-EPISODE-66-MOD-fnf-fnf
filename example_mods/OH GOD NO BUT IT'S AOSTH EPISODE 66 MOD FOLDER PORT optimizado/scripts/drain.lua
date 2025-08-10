function opponentNoteHit(id, direction, noteType, isSustainNote)
if getProperty('health') > 0.3 then
    if not isSustainNote then
           setProperty('health', getProperty('health') - 0.020)
        end
    end
end