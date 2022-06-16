/**
 *Submitted for verification at BscScan.com on 2022-04-05
*/

// SPDX-License-Identifier: agpl-3.0
pragma solidity ^0.8.0;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);
   

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}


pragma solidity ^0.8.0;

// CAUTION
// This version of SafeMath should only be used with Solidity 0.8 or later,
// because it relies on the compiler's built in overflow checks.

/**
 * @dev Wrappers over Solidity's arithmetic operations.
 *
 * NOTE: `SafeMath` is generally not needed starting with Solidity 0.8, since the compiler
 * now has built in overflow checking.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryAdd(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            uint256 c = a + b;
            if (c < a) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function trySub(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b > a) return (false, 0);
            return (true, a - b);
        }
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryMul(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
            // benefit is lost if 'b' is also tested.
            // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
            if (a == 0) return (true, 0);
            uint256 c = a * b;
            if (c / a != b) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the division of two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryDiv(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a / b);
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryMod(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a % b);
        }
    }

    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return a - b;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        return a * b;
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator.
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return a / b;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return a % b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {trySub}.
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b <= a, errorMessage);
            return a - b;
        }
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a / b;
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting with custom message when dividing by zero.
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {tryMod}.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a % b;
        }
    }
}

pragma solidity ^0.8.0;

contract ReferrerContract{
        
        uint256 totalreferrerid;

        struct Referrer{
            uint256 id;
            address referrer;
            address[] users;
            uint256 level;
            mapping(address => uint256) stakeamount;
            mapping(address => uint256) rewardtimestamp;
            mapping(address => bool) validreferral;
            bool xamount;
            bool yamount;
        }
       
        mapping(address => Referrer) public referrerDetails;

        function getReferrerDetail(
            address _address
        ) public view returns(uint256 id,address referrer,address[] memory users,uint256 level){
            Referrer storage ref=referrerDetails[_address];
            id=ref.id;
            referrer=ref.referrer;
            users=ref.users;
            level=ref.level;
        }

        function getStakeAmount(
            address _address
        ) public view returns(uint256){
             Referrer storage ref=referrerDetails[_address];
             return ref.stakeamount[_address];
        }    
        function getRewardTimestamp(
            address _referrer,
            address _reffered
        ) public view returns(uint256){
             Referrer storage ref=referrerDetails[_referrer];
             return ref.rewardtimestamp[_reffered];
        }    
        function getValidReferral(
            address _referrer,
            address _reffered
        ) public view returns(uint256){
             Referrer storage ref=referrerDetails[_referrer];
             return ref.stakeamount[_reffered];
        }   
        function getReferredUsers(
            address _address
        ) public view returns(address[] memory){
            Referrer storage ref=referrerDetails[_address];
            return ref.users;
        }    
}


pragma solidity ^0.8.0;

contract Staking is ReferrerContract{

    constructor(IERC20 _gcex) {
        gcex=_gcex;
        owner=msg.sender;
        address[] memory a;
        GCSPlans memory gcs=GCSPlans(0,10,360,owner,2,2,0,a);
        GCSPlans memory gcs1=GCSPlans(1,10,180,owner,2,2,0,a);
        gcsplans.push(gcs);
        gcsplans.push(gcs1);
    }

    using SafeMath for uint256;

    IERC20 public gcex;
    address public owner;

    uint256 totalstaked;
    uint256 public xamount=1000000000000000000;
    uint256 public yamount=1000000000000000000;
    uint256 public zamount=1000000000000000000;
    uint256 public totalgcsfund;
    uint256 totalseconds=86400;

    enum Status{Started,Finished}

    struct UserDetails{
        uint256 amount;
        address useraddress;
        uint256 apr;
        uint256 starttime;
        uint256 endtime;
        uint256 day;
        uint256 plan;
        bool stake;
        Status status;
    }

    struct GCSPlans{
        uint256 planid;
        uint256 apr;
        uint256 day;
        address gcexaddress;
        uint256 withdrawfee; 
        uint256 rewardfee;
        uint256 staked;
        address[] stakeaddress;
    }
    struct ReferrerDetail{
        address referrer;
        uint256 referrerendtime;
    }

    GCSPlans[] public gcsplans;
   
    mapping(address => UserDetails[]) public UserList;
    mapping(uint256 => address) public refaddress;
    mapping(address => ReferrerDetail) public referrer;

    /*
        @dev Sets the values of {planid},{apr},{day},
        {gcexaddress},{withdrawfee},{rewardfee}
    */

    function addGCSPlan(
        uint256 planid,
        uint256 apr,
        uint256 day,
        address gcexaddress,
        uint256 withdrawfee,
        uint256 rewardfee
    ) public onlyOwner{
         address[] memory a;
         GCSPlans memory gcs=GCSPlans(planid,apr,day,gcexaddress,withdrawfee,rewardfee,0,a);
         gcsplans.push(gcs);
    }

    function updateGCSPlan(
        uint256 _plan,
        uint256 apr,
        address gcexaddress,
        uint256 withdrawfee,
        uint256 rewardfee
    ) public onlyOwner{
         GCSPlans storage gcs=gcsplans[_plan];
         gcs.apr=apr;
         gcs.gcexaddress=gcexaddress;
         gcs.withdrawfee=withdrawfee; 
         gcs.rewardfee=rewardfee;  
    }
    
    /*
        @dev Sets the values of {xamount},{yamount},{zamount}
    */

    function setBaseAmounts(
        uint256 _xamount,
        uint256 _yamount,
        uint256 _zamount
    ) public onlyOwner{
        xamount=_xamount;
        yamount=_yamount;
        zamount=_zamount;
    }

    /*
        @dev Sets the values of {totalseconds}
    */

    
    function changeSeconds(
        uint256 _totalseconds
    ) public onlyOwner{
        totalseconds=_totalseconds;
    }

    /*
        @dev user can stake {amount} with a {plan} if he has no referrer
    */

    function level1stake(
        uint256 _amount,
        uint256 _plan
    ) public{
        GCSPlans storage gcs=gcsplans[_plan];
        Referrer storage ref=referrerDetails[msg.sender];
       
        UserDetails memory _user=UserDetails({
            amount:_amount,
            useraddress:msg.sender,
            apr:gcs.apr,
            starttime:block.timestamp,
            endtime:block.timestamp.add(gcs.day*totalseconds),
            day:gcs.day,
            plan:_plan,
            stake:false,
            status:Status.Started
        });

        ref.level=1;
        UserList[msg.sender].push(_user);
        totalstaked+=_amount;
        gcs.staked+=_amount;
        gcex.transferFrom(msg.sender,gcs.gcexaddress,_amount);
        gcs.stakeaddress.push(msg.sender);
      
        if(_amount >= xamount && ref.id==0){
            ref.xamount=true;
            totalreferrerid+=1;
            refaddress[totalreferrerid]=msg.sender;
            ref.id=totalreferrerid;
        }
    }

    /*
        @dev user can stake {amount} with a {plan} with referrer and 
        referrer should be in the level 1
    */

    function level2stake(
        uint256 _amount,
        uint256 _plan,
        address _referrer
    ) public{
        UserDetails[] storage _user=UserList[msg.sender];
        GCSPlans storage gcs=gcsplans[_plan];
        Referrer storage ref=referrerDetails[_referrer];
        Referrer storage level2ref=referrerDetails[msg.sender];
        if(_user.length == 0){
            UserDetails memory user=UserDetails({
                amount:_amount,
                useraddress:msg.sender,
                apr:gcs.apr,
                starttime:block.timestamp,
                endtime:block.timestamp.add(gcs.day*totalseconds),
                day:gcs.day,
                plan:_plan,
                stake:false,
                status:Status.Started
            });
            UserList[msg.sender].push(user);
            level2ref.level=2;
            totalstaked+=_amount;
            gcs.staked+=_amount;
            ref.rewardtimestamp[msg.sender]=block.timestamp+uint256(30 days);
            gcs.stakeaddress.push(msg.sender);
            gcex.transferFrom(msg.sender,gcs.gcexaddress,_amount);
        }
        else{
            UserDetails memory user=UserDetails({
                amount:_amount,
                useraddress:msg.sender,
                apr:gcs.apr,
                starttime:block.timestamp,
                endtime:block.timestamp.add(gcs.day*totalseconds),
                day:gcs.day,
                plan:_plan,
                stake:false,
                status:Status.Started
            });
            UserList[msg.sender].push(user);
            totalstaked+=_amount;
            gcs.staked+=_amount;
            gcex.transferFrom(msg.sender,gcs.gcexaddress,_amount);
        }
        if(_amount >= yamount && level2ref.id==0){
            level2ref.yamount=true;
            totalreferrerid+=1;
            refaddress[totalreferrerid]=msg.sender;
            level2ref.id=totalreferrerid;
        }
        if(_amount >= yamount && block.timestamp <=ref.rewardtimestamp[msg.sender] ){
            ref.validreferral[msg.sender]=true;
        }
    }

    /*
        @dev user can stake {amount} with a {plan} with referrer and 
        referrer should be in the level 2
    */

    function level3stake(
        uint256 _amount,
        uint256 _plan,
        address _referrer
    ) public{

        GCSPlans storage gcs=gcsplans[_plan];
        UserDetails[] storage _user=UserList[msg.sender];
        Referrer storage ref=referrerDetails[_referrer];
        Referrer storage level3=referrerDetails[msg.sender];
       
        if(_user.length == 0){
            level3.level=3;
            UserDetails memory user=UserDetails({
            amount:_amount,
            useraddress:msg.sender,
            apr:gcs.apr,
            starttime:block.timestamp,
            endtime:block.timestamp.add(gcs.day*totalseconds),
            day:gcs.day,
            plan:_plan,
            stake:false,
            status:Status.Started
            });
            totalstaked+=_amount;
            gcs.staked+=_amount;
            gcs.stakeaddress.push(msg.sender);
            UserList[msg.sender].push(user);
            ref.rewardtimestamp[msg.sender]=block.timestamp+uint256(30 days);
            gcex.transferFrom(msg.sender,gcs.gcexaddress,_amount);
        }
        else{
            UserDetails memory user=UserDetails({
            amount:_amount,
            useraddress:msg.sender,
            apr:gcs.apr,
            starttime:block.timestamp,
            endtime:block.timestamp.add(gcs.day*totalseconds),
            day:gcs.day,
            plan:_plan,
            stake:false,
            status:Status.Started
            });
            totalstaked+=_amount;
            gcs.staked+=_amount;
            UserList[msg.sender].push(user);
            gcex.transferFrom(msg.sender,gcs.gcexaddress,_amount);
        }
        if(_amount >= zamount && block.timestamp <=ref.rewardtimestamp[msg.sender] ){
            ref.validreferral[msg.sender]=true;
        }
    }

    /*
        @dev 
        @return the bool value of level1referrer
    */

    function validLevel1Referral(
        address _address
    ) external view returns(bool validref){
        Referrer storage ref=referrerDetails[_address];
        require(ref.level ==1,'You are not in the level1');
        uint256 valid;
        for(uint256 i=0;i < ref.users.length;i++ ){
            if(ref.validreferral[ref.users[i]] == true){
                valid++;
            }
        }
        if(valid >=5 && ref.xamount == true){
            return true;
        }
    }

   
    /*
        @dev sets the value of referer to the user
    */
    
    function addReferrer(
        address _referrer
    ) public{
        require(_referrer != msg.sender && _referrer != address(0),'Not allowed');
        Referrer storage ref=referrerDetails[_referrer];
        require( referrer[msg.sender].referrer==address(0),"You have referrer already");
        referrer[msg.sender].referrer=_referrer;
        referrer[msg.sender].referrerendtime=block.timestamp.add(uint256(365 days));
        ref.users.push(msg.sender);
        ref.rewardtimestamp[msg.sender]=block.timestamp.add(uint256(30 days));
    }

    /*
        @dev
        @return the value of level of the referrer
    */

    function levelofReferrer(
        address _address
    ) public view returns(uint256){
         Referrer storage ref=referrerDetails[_address];
         return ref.level;
    }

    function gcsfund(
        uint256 _amount
    ) public onlyOwner{
         gcex.transferFrom(msg.sender,address(this),_amount);
         totalgcsfund+=_amount;
    }

    /*
        @dev user can withdraw the amount with reward
    */

    function withdraw(
        uint256 _id
    ) public{

        UserDetails[] storage user=UserList[msg.sender];
        UserDetails storage _user=user[_id];
        require(_user.status != Status.Finished,'Withdrawn aldready');
        GCSPlans memory gcs=gcsplans[_user.plan];
        ReferrerDetail memory _ref=referrer[msg.sender];
        Referrer storage ref=referrerDetails[_ref.referrer];
        require(block.timestamp >= _user.endtime,'Staking has not been completed');
        (uint256 totalamount,uint256 totalreward,)=calculateReward(_id,msg.sender);
        require(gcex.balanceOf(address(this) )>= totalamount ,'Not sufficient balance in contractaddress');
        gcs.staked-=_user.amount;
        totalstaked-=_user.amount;
        _user.status=Status.Finished;
        address referreraddress=_ref.referrer;
        uint256 level=ref.level;
        if(level == 1 && validLevel1Count(referreraddress) >=2 && block.timestamp <=_ref.referrerendtime){
           uint256 rewardbonus=totalreward.mul(2).div(100);
           uint256 ownerbonus=totalreward.mul(2).div(100);
           gcex.transfer(msg.sender,totalamount.sub(ownerbonus+rewardbonus));
           gcex.transfer(gcs.gcexaddress,ownerbonus);
           gcex.transfer(referreraddress,rewardbonus);
           return;
        }
        else if(level == 2 && validLevel2Count(referreraddress) >=2 && block.timestamp <=_ref.referrerendtime){
           uint256 owneramt=totalreward.mul(2).div(100);
           uint256 reward=totalreward.mul(2).div(100);
           uint256 level1reward=reward.mul(40).div(100);
           uint256 level2reward=reward.mul(60).div(100);
           address level1ref=_ref.referrer;
           gcex.transfer(msg.sender,totalamount.sub(owneramt+reward));
           gcex.transfer(gcs.gcexaddress,owneramt);
           gcex.transfer(referreraddress,level2reward);
           gcex.transfer(level1ref,level1reward);
           return;
        }
        else if(level == 3 ){
           uint256 owneramt=totalreward.mul(2).div(100);
           gcex.transfer(msg.sender,totalamount.sub(owneramt));
           gcex.transfer(gcs.gcexaddress,owneramt); 
           return;
        }
        else{
        uint256 owneramt2=totalreward.mul(2).div(100);
        gcex.transfer(msg.sender,totalamount.sub(owneramt2));
        gcex.transfer(gcs.gcexaddress,owneramt2); 
        }

    }
    
    /*
        @dev user can withdraw the  reward
    */

    function claimrewardandAutoStake(
        uint256 _id,
        uint256 _plan
    ) public{
        UserDetails[] storage user=UserList[msg.sender];
        UserDetails storage _user=user[_id];
        GCSPlans storage gcs=gcsplans[_plan];
        ReferrerDetail memory _ref=referrer[msg.sender];
        Referrer storage ref=referrerDetails[_ref.referrer];
        require(block.timestamp >= _user.endtime,'Time not completed');
        (,uint256 totalreward,)=calculateReward(_id,msg.sender);
        _user.starttime=block.timestamp;
        _user.endtime=block.timestamp.add(gcs.day * totalseconds);
        _user.apr=gcs.apr;
        _user.day=gcs.day;
        gcs.stakeaddress.push(msg.sender); 
        address referreraddress=_ref.referrer;
        uint256 level=ref.level;

        if(level == 1 && validLevel1Count(referreraddress) >=2 && block.timestamp <=_ref.referrerendtime){
           uint256 rewardbonus=totalreward.mul(2).div(100);
           uint256 ownerbonus=totalreward.mul(2).div(100);
           gcex.transfer(gcs.gcexaddress,ownerbonus);
           gcex.transfer(referreraddress,rewardbonus);
           gcex.transfer(msg.sender,totalreward.sub(rewardbonus+ownerbonus));
           return;
        }
        else if(level == 2 && validLevel2Count(referreraddress) >=2 && block.timestamp <=_ref.referrerendtime){
           uint256 owneramt=totalreward.mul(2).div(100);
           uint256 reward=totalreward.mul(2).div(100);
           uint256 level1reward=reward.mul(40).div(100);
           uint256 level2reward=reward.mul(60).div(100);
           address level1ref=_ref.referrer;
           gcex.transfer(gcs.gcexaddress,owneramt);
           gcex.transfer(referreraddress,level2reward);
           gcex.transfer(level1ref,level1reward);
           gcex.transfer(msg.sender,totalreward.sub(owneramt+level1reward+level2reward));
           return;
        }
        else if(level == 3 ){
           uint256 owneramt=totalreward.mul(2).div(100);
           gcex.transfer(gcs.gcexaddress,owneramt); 
           gcex.transfer(msg.sender,totalreward.sub(owneramt));
           return;
        }
        else{
            uint256 owneramt2=totalreward.mul(2).div(100);
            gcex.transfer(gcs.gcexaddress,owneramt2); 
            gcex.transfer(msg.sender,totalreward.sub(owneramt2));
        }
    }

     /*
        @dev 
        @return the validcount value of level1referrer
    */

    function validLevel1Count(
        address _address
    ) internal view returns(uint256 count){
        Referrer storage ref=referrerDetails[_address];
        require(ref.level ==1,'You are not in the level1');
        uint256 valid;
        for(uint256 i=0;i < ref.users.length;i++ ){
            if(ref.validreferral[ref.users[i]] == true){
                valid++;
            }
        }
        return valid;
    }

    /*
        @dev 
        @return the bool value of level2referrer
    */

    function validLevel2Referral(
        address _address
    ) internal view returns(bool validref){
        Referrer storage ref=referrerDetails[_address];
        require(ref.level == 2 ,'You are not in the level2');
        uint256 valid;
        for(uint256 i=0;i < ref.users.length;i++ ){
            if(ref.validreferral[ref.users[i]] == true){
                valid++;
            }
        }
        if(valid >=5 && ref.yamount == true){
            return true;
        }
    }

    /*
        @dev 
        @return the validcount value of level2referrer
    */

     function validLevel2Count(
         address _address
    ) internal view returns(uint256 count){
        Referrer storage ref=referrerDetails[_address];
        require(ref.level == 2 ,'You are not in the level2');
        uint256 valid;
        for(uint256 i=0;i < ref.users.length;i++ ){
            if(ref.validreferral[ref.users[i]] == true){
                valid++;
            }
        }
        return valid;
    }


    /*
        @return {totalamount},{totalreward},{daily}
    */

    function calculateReward(
        uint256 _id,
        address _address
    ) public view returns(uint256,uint256,uint256){
        UserDetails[] memory user=UserList[_address];
        UserDetails memory _user=user[_id];
        uint256 principal=_user.amount;
        uint256 dailyinterest=principal.mul(_user.apr).div(365).div(100);
        uint256 totalinterest=dailyinterest.mul(_user.day);
        uint256 totalamount=_user.amount.add(totalinterest);
        return (totalamount,totalinterest,dailyinterest);
    }

    /*
        @return the {address} if 'id' is passed
    */

    function getAddress(
        uint256 _id
    ) public view returns(address){
        return refaddress[_id];
    }

    /*
        @return the {level} if '_address' is passed
    */

    function getLevel(
        address _address
    ) public view returns(uint256){
        return referrerDetails[_address].level;
    }

    /*
        @return all of the {gcsplans} 
    */

    function getPlanDetails(
    ) public view returns(GCSPlans[] memory){
        return gcsplans;
    }

    /*
        @return {UserDetails} if '_address' is passes
    */

    function getUserDetails(
        address _address
    ) public view returns(UserDetails[] memory){
        return UserList[_address];
    }

    /*
        @return {xamount},{yamount},{zamount}
    */

    function getBaseAmounts()
    public view returns(uint256,uint256,uint256){
        return (xamount,yamount,zamount);
    }

    /*
        @return gcex balance in the contract
    */

    function gcxbalance()
    public view returns(uint256){
        return gcex.balanceOf(address(this));
    }

    /*
        @dev onlyOwner function to be accessed by owner alone
    */

    modifier onlyOwner{
        require(msg.sender == owner,'you are not the owner');
        _;
    }

}   
