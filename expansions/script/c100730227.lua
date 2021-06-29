--高速决斗技能-魔法组合技
Duel.LoadScript("speed_duel_common.lua")
function c100730227.initial_effect(c)
	aux.SpeedDuelBeforeDraw(c,c100730227.skill)
	aux.SpeedDuelAtMainPhase(c,c100730227.skill1,c100730227.con,aux.Stringid(100730227,1))
	aux.RegisterSpeedDuelSkillCardCommon()
end
function c100730227.skill(e,tp,eg,ep,ev,re,r,rp)
	tp=e:GetLabelObject():GetOwner()
	local c=e:GetLabelObject()
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(100730227,2))
	e1:SetCategory(CATEGORY_TOHAND+CATEGORY_SEARCH)
	e1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_F)
	e1:SetProperty(EFFECT_FLAG_DELAY)
	e1:SetCode(EVENT_SUMMON_SUCCESS)
	e1:SetCondition(c100730227.thcon)
	e1:SetOperation(c100730227.thop)
	Duel.RegisterEffect(e1,tp)
	local e2=e1:Clone()
	e2:SetCode(EVENT_SPSUMMON_SUCCESS)
	Duel.RegisterEffect(e2,tp)
	e:Reset()
end
function c100730227.thcon(e,tp,eg,ep,ev,re,r,rp)
	local tc=eg:GetFirst()
	return tc:GetSummonPlayer()==tp and tc:IsFaceup() and tc:IsCode(13429800,51254277)
end
function c100730227.thop(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_ATOHAND)
	local g2=Duel.SelectMatchingCard(tp,Card.IsCode,tp,LOCATION_DECK+LOCATION_GRAVE,0,0,1,nil,7653207)
	Duel.SendtoHand(g2,nil,REASON_EFFECT)
	Duel.ConfirmCards(1-tp,g2)
end
function c100730227.con(e,tp)
	tp=e:GetLabelObject():GetOwner()
	return aux.SpeedDuelAtMainPhaseCondition(e,tp)
		and Duel.IsExistingMatchingCard(Card.IsCode,tp,LOCATION_DECK,0,1,nil,50532786)
		and Duel.IsExistingMatchingCard(c100730227.tlimit,tp,LOCATION_MZONE,0,1,nil)
		and Duel.GetActivityCount(tp,ACTIVITY_NORMALSUMMON)==0
end
function c100730227.tlimit(c)
	return c:IsAttribute(ATTRIBUTE_WATER) 
		and not (c:IsHasEffect(EFFECT_UNRELEASABLE_SUM))
end
function c100730227.skill1(e,tp,eg,ep,ev,re,r,rp)
	tp=e:GetLabelObject():GetOwner()
	Duel.Hint(HINT_CARD,1-tp,100730227)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SELECT)
	local g1=Duel.SelectMatchingCard(tp,Card.IsCode,tp,LOCATION_DECK,0,1,1,nil,50532786)
	local c=g1:GetFirst()
	Duel.Summon(tp,c,false,nil)
end