-- Função de Rollback Selecionada (Ajustada para não afetar o movimento)
EnableButton.MouseButton1Click:Connect(function()
    rollbackEnabled = not rollbackEnabled
    EnableButton.Text = rollbackEnabled and "Disable Rollback" or "Enable Rollback"
    RollbackFrame.Visible = rollbackEnabled
    
    -- Apenas hookear funções específicas que impactam o sistema de passivas
    if rollbackEnabled then
        for _, v in pairs(getgc(true)) do
            if typeof(v) == "function" and islclosure(v) then
                local name = getinfo(v).name or "unknown"
                -- Hookear funções específicas, por exemplo:
                if string.find(name:lower(), "roll") or string.find(name:lower(), "passive") then
                    hookfunction(v, function(...) return end)
                end
            end
        end
    else
        -- Caso o rollback seja desativado, reverter a função
        for _, v in pairs(getgc(true)) do
            if typeof(v) == "function" and islclosure(v) then
                local name = getinfo(v).name or "unknown"
                if string.find(name:lower(), "roll") or string.find(name:lower(), "passive") then
                    -- Aqui restauramos a função original (sem bloqueios)
                    unhookfunction(v)
                end
            end
        end
    end
end)
