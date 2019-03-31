<?php
/**
 * Created by IntelliJ IDEA.
 * User: stopka
 * Date: 27.3.19
 * Time: 15:42
 */

namespace Stopka\MediaFactory\Model\Database\Entities\Properties;


use Doctrine\ORM\Mapping as ORM;
use Ramsey\Uuid\Uuid;

trait TInternalNameProperty
{
    /**
     * @var string
     * @ORM\Column(type="string", unique=true)
     */
    protected $internalName;

    public function __construct(string $internalName)
    {
        $this->internalName = $internalName;
    }


    /**
     * @return string
     */
    public function getInternalName(): string
    {
        return $this->internalName;
    }
}
