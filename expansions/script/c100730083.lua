--高速决斗技能-召唤封锁
Duel.LoadScript("speed_duel_common.lua")
function c100730083.initial_effect(c)
	aux.SpeedDuelAtMainPhase(c,c100730083.skill,c100730083.con,aux.Stringid(100730083,0))
	aux.RegisterSpeedDuelSkillCardCommon()
end
function c100730083.con(e,tp)
	tp=e:GetLabelObject():GetOwner()
	return aux.SpeedDuelAtMainPhaseCondition(e,tp)
		and Duel.GetLP(tp)<=2500
end
function c100730083.skill(e,tp)
	tp=e:GetLabelObject():GetOwner()
	Duel.Hint(HINT_CARD,1-tp,100730083)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_FIELD)
	e1:SetProperty(EFFECT_FLAG_PLAYER_TARGET)
	e1:SetCode(EFFECT_CANNOT_SPECIAL_SUMMON)
	e1:SetTargetRange(1,1)
	e1:SetTarget(c100730083.splimit)
	e1:SetReset(RESET_PHASE+PHASE_END,2)
	Duel.RegisterEffect(e1,tp)
	local e2=e1:Clone()
	e2:SetCode(EFFECT_CANNOT_SUMMON)
	Duel.RegisterEffect(e2,tp)
	local e3=e1:Clone()
	e3:SetCode(EFFECT_CANNOT_MSET)
	Duel.RegisterEffect(e3,tp)
	local e4=e1:Clone()
	e4:SetCode(EFFECT_CANNOT_ACTIVATE)
	Duel.RegisterEffect(e4,tp)
	e:Reset()
end
function c100730083.splimit(e,c)
	return c:IsType(TYPE_MONSTER) and c:IsType(TYPE_EFFECT)
end
function c100730083.limit(e,c,sump,sumtype,sumpos,targetp,se)
	return c:IsLocation(LOCATION_GRAVE)
end
