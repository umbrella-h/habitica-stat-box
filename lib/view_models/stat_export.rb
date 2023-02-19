module ViewModels
    class StatExport
        def build(user_profile:)
            [
                "@#{user_profile[:username]} 🥷 Level #{user_profile[:level]} #{user_profile[:class]} ",
                "🩸 Health #{user_profile[:stats][:hp].floor}/#{user_profile[:max_stats][:max_hp].floor} 💪 Exp #{user_profile[:stats][:exp].floor}/#{user_profile[:max_stats][:max_exp].floor} 💎 Mana #{user_profile[:stats][:mp].floor}/#{user_profile[:max_stats][:max_mp].floor}",
                "> Every pet 🦊, equipment 🗡, or level up 🔺",
                "> represents my dedication to", 
                "> developing good habits 👏",
        ].join("\n")
        end
    end
end