--高速决斗技能-丧悼之假面
Duel.LoadScript("speed_duel_common.lua")
function c100730170.initial_effect(c)
	aux.SpeedDuelAtMainPhase(c,c100730170.skill,c100730170.con,aux.Stringid(100730170,0))
	aux.RegisterSpeedDuelSkillCardCommon()
end
function c100730170.con(e,tp)
	tp=e:GetLabelObject():GetOwner()
	return aux.SpeedDuelAtMainPhaseCondition(e,tp)
		and Duel.IsPlayerCanSpecialSummon(tp)
		and Duel.GetMZoneCount(tp)>0
		and Duel.IsExistingMatchingCard(Card.IsCode,tp,LOCATION_MZONE+LOCATION_GRAVE,0,2,nil,13676474,86569121)
		and Duel.IsExistingMatchingCard(Card.IsCode,tp,LOCATION_DECK+LOCATION_GRAVE+LOCATION_HAND,0,1,nil,48948935)
end
function c100730170.skill(e,tp,c)
	tp=e:GetLabelObject():GetOwner()
	Duel.Hint(HINT_CARD,1-tp,100730170)
	local g1=Duel.GetMatchingGroup(Card.IsCode,tp,LOCATION_MZONE+LOCATION_GRAVE,0,2,nil,13676474,86569121)
	local c=g1:Select(tp,2,2,nil)
	if c then
		Duel.ConfirmCards(1-tp,c)
		Duel.SendtoDeck(c,nil,2,REASON_RULE)
		local g=Duel.SelectMatchingCard(tp,aux.NecroValleyFilter(c100730170.filter),tp,LOCATION_DECK+LOCATION_GRAVE+LOCATION_HAND,0,1,1,nil)
		if g:GetCount()>0 then
		Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SPSUMMON)
		local tc=g:GetFirst()
		if tc and Duel.SpecialSummonStep(tc,0,tp,tp,true,true,POS_FACEUP) then
			local e1=Effect.GlobalEffect()
			e1:SetType(EFFECT_TYPE_FIELD)
			e1:SetProperty(EFFECT_FLAG_PLAYER_TARGET+EFFECT_FLAG_OATH)
			e1:SetCode(EFFECT_CANNOT_SPECIAL_SUMMON)
			e1:SetReset(RESET_PHASE+PHASE_END)
			e1:SetTargetRange(1,0)
			Duel.RegisterEffect(e1,tp,true)
			e1:SetOwnerPlayer(tp)
			tc:RegisterEffect(e1,true)
			end
			Duel.SpecialSummonComplete()
		end
	end
end

function c100730170.filter(c)
	return c:IsCode(48948935)
end