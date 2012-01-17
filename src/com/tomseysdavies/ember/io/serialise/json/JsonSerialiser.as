package com.tomseysdavies.ember.io.serialise.json
{
	
	import com.tomseysdavies.ember.entitySystem.api.IEntity;
	import com.tomseysdavies.ember.entitySystem.api.IEntityManager;
	import com.tomseysdavies.ember.io.EntityEncoder;

	public class JsonSerialiser
	{
		private var _entityEncoder:EntityEncoder;
		
		
		public function JsonSerialiser()
		{
			_entityEncoder = new EntityEncoder();
		}
		
		public function serialise(entityManager:IEntityManager):String{
			var entities:Vector.<IEntity> =  entityManager.getAll();
			var entiyList:Array = []; 
			for each(var entity:IEntity in entities){				
				var encoded:Object = _entityEncoder.encode(entity);
				entiyList.push(encoded);
			}
			return JSON.stringify(entiyList);
		}
		
		public function deserialise(data:String,entityManager:IEntityManager):void{
			var entiyList:Array = JSON.parse(data) as Array;

			for each(var entityData:Object in entiyList){	
				_entityEncoder.decode(entityManager,entityData);
			}
		}
	}
}