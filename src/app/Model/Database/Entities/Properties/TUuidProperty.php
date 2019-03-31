<?php
/**
 * Created by IntelliJ IDEA.
 * User: stopka
 * Date: 1.4.19
 * Time: 0:46
 */

namespace Stopka\MediaFactory\Model\Database\Entities\Properties;


use Doctrine\ORM\Mapping as ORM;
use Ramsey\Uuid\Uuid;
use Ramsey\Uuid\UuidInterface;

trait TUuidProperty
{

    /**
     * @var UuidInterface
     * @ORM\Id()
     * @ORM\Column(type="uuid_binary", unique=true)
     * @ORM\GeneratedValue(strategy="CUSTOM")
     * @ORM\CustomIdGenerator(class="Ramsey\Uuid\Doctrine\UuidGenerator")
     */
    private $id;

    public function getId(): UuidInterface
    {
        if(!$this->id){
            $this->id = Uuid::uuid4();
        }
        return $this->id;
    }

    public function __clone()
    {
        $this->id = Uuid::uuid4();
    }

}
